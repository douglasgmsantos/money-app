import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key});

  final String? errorText = null;
  final String? labelText = null;
  final dynamic? suffixIcon = null;
  final TextEditingController controller = TextEditingController();
  final void Function(String)? onChanged = null;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          errorText: errorText, labelText: labelText, suffixIcon: suffixIcon),
      controller: controller,
      onChanged: onChanged,
    );
  }
}
