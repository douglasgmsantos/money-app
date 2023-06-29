import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      this.isPassword = false,
      required this.labelText,
      required this.validator,
      this.onChanged});

  final bool isPassword;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
          validator: widget.validator,
          obscureText: widget.isPassword && !isVisible,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
              labelText: widget.labelText,
              suffixIcon: (widget.isPassword)
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Icon(!isVisible
                          ? Icons.remove_red_eye_rounded
                          : Icons.remove_red_eye_outlined),
                    )
                  : null)),
    );
  }
}
