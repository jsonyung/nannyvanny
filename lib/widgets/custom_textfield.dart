import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../values/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final String? errorText; // Add errorText parameter
  final TextEditingController? controller; // Add controller parameter

  const CustomTextField({
    super.key,
    required this.hintText,
    this.initialValue,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.suffixIcon,
    this.errorText, // Initialize errorText
    this.controller, // Initialize controller
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      // Use the passed controller
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        suffixIcon: suffixIcon,
        border: const UnderlineInputBorder(),
        // Add an underline border
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.customPink), // Customize focused border color
        ),
        errorText: errorText, // Display error text if provided
      ),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
    );
  }
}
