import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        margin: const EdgeInsets.all(24),
        behavior: SnackBarBehavior.floating,
        content: Text(message)));
  }
}
