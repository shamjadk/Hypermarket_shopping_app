import 'package:flutter/material.dart';
import 'package:hypermarket_ecommerce/core/theme/theme.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;
  const ElevatedButtonWidget(
      {super.key, required this.onPressed, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppTheme.appThemeColor),
            foregroundColor: MaterialStatePropertyAll(Colors.white)),
        onPressed: onPressed,
        child: Text(buttonName));
  }
}
