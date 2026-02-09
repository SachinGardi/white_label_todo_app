import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/config_cubit.dart';
import 'mock_api.dart';
import 'theme/app_theme.dart';
import 'todo/todo_bloc.dart';
import 'ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ConfigCubit()..loadConfig(mockApiResponse)),
        BlocProvider(create: (_) => TodoBloc()),
      ],
      child: BlocBuilder<ConfigCubit, dynamic>(
        builder: (context, config) {
          if (config == null) return const SizedBox();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: config.appName,
            theme: AppTheme.light(config),
            darkTheme: AppTheme.dark(config),
            themeMode:
            config.isDark ? ThemeMode.dark : ThemeMode.light,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
