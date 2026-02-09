import 'package:flutter/material.dart';

class DynamicButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const DynamicButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(label),
    );
  }
}
