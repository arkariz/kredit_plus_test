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
      maxLines: 4,
      style: TextStyle(
          fontSize: 10.0,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          color: textColor ?? Colors.black,
          overflow: TextOverflow.ellipsis),
    );
  }
}
