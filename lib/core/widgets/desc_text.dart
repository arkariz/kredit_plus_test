import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required this.text,
    this.textColor,
  }) : super(key: key);

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10.0,
        // fontFamily: "Manrope",
        fontWeight: FontWeight.w400,
        color: textColor ?? Colors.black,
      ),
    );
  }
}
