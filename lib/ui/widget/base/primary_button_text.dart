import 'package:flutter/material.dart';

class PrimaryButtonText extends StatelessWidget {
  const PrimaryButtonText({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color,
    this.margin,
    this.padding,
  }) : super(key: key);
  final Function() onPressed;
  final String text;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: padding == null ? null : MaterialStateProperty.all(padding),
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
      ),
    );
  }
}
