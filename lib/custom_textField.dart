import 'package:flutter/material.dart';
import 'package:widgetassignment/color_schema.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final bool obscureText;
  final bool isEmail;
  final bool showSuffixIcon; // New parameter to control suffix icon visibility

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.validator,
    this.controller,
    this.obscureText = false,
    this.isEmail = false,
    this.showSuffixIcon = false, // Default value is false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.primaryColor,
      obscureText: obscureText,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColors.textDark,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        suffixIcon: showSuffixIcon
            ? const Icon(Icons.visibility_off)
            : null, // Conditionally display suffix icon
      ),
      validator: validator,
    );
  }
}
