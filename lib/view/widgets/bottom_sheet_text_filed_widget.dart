import 'package:flutter/material.dart';
import 'package:hypermarket_ecommerce/core/theme/theme.dart';

class BottomSheettextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const BottomSheettextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        cursorColor: AppTheme.appThemeColor,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is Required';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
