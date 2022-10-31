import 'package:flutter/material.dart';

class PrimaryButtonText extends StatelessWidget {
  const PrimaryButtonText({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color,
  }) : super(key: key);
  final Function() onPressed;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black;
            }
            return Colors.transparent;
          },
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Colors.white,
        ),
      ),
    );
  }
}
