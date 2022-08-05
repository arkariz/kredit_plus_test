import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  const PriceText({
    Key? key,
    required this.text,this.textColor,
  }) : super(key: key);

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.0,
        fontFamily: "Inter",
        fontWeight: FontWeight.bold,
        color: textColor ?? Colors.black,
      ),
    );
  }
}
