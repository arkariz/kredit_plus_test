import 'package:flutter/material.dart';

class H1Text extends StatelessWidget {
  const H1Text({
    Key? key,
    required this.text, this.textColor,
  }) : super(key: key);

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.0,
        // fontFamily: "Manrope",
        fontWeight: FontWeight.bold,
        color: textColor ?? Colors.black,
      ),
    );
  }
}
