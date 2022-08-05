import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
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
      maxLines: 2,
      style: TextStyle(
        fontSize: 12.0,
        fontFamily: "Inter",
        fontWeight: FontWeight.bold,
        color: textColor ?? Colors.black,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
