import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;
  final bool isLoading;
  final bool disabled;

  const ButtonPrimary(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed,
      this.isLoading = false,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed:
              disabled == false ? onPressed as void Function()? : () => {},
          style: ButtonStyle(
            backgroundColor: disabled
                ? MaterialStateProperty.all<Color>(const Color(0xFFd3d3d3))
                : MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 23.0,
                horizontal: 19.0,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          child: isLoading
              ? LoadingAnimationWidget.inkDrop(color: Colors.white, size: 30)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text,
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ],
                ),
        ));
  }
}
