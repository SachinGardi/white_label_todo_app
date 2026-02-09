import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_config.dart';

class ConfigCubit extends Cubit<AppConfig?> {
  ConfigCubit() : super(null);

  void loadConfig(Map<String, dynamic> json) {
    emit(AppConfig.fromJson(json));
  }
}
