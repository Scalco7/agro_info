import 'package:flutter/material.dart';

class WeatherDayDetailWidget extends StatelessWidget {
  final String title;
  final String data;
  final String supportText;
  final Color? textColor;
  const WeatherDayDetailWidget({
    super.key,
    required this.title,
    required this.data,
    this.textColor,
    this.supportText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 0,
      children: [
        Text(title, style: TextStyle(fontSize: 8, color: textColor)),
        Text.rich(
          TextSpan(
            text: data,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
            children: [
              TextSpan(
                text: supportText,
                style: TextStyle(fontSize: 8, color: textColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
