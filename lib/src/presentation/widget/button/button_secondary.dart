import 'package:flutter/material.dart';

class ButtonSecondary extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;

  const ButtonSecondary({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        width: double.maxFinite,
        child: TextButton(
          onPressed: onPressed as void Function()?,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor)),
              Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ));
  }
}
