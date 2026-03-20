import 'package:flutter/material.dart';

class WeatherDayDetailWidget extends StatelessWidget {
  final String title;
  final String data;
  final String supportText;
  const WeatherDayDetailWidget({
    super.key,
    required this.title,
    required this.data,
    this.supportText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 0,
      children: [
        Text(title, style: TextStyle(fontSize: 8)),
        Text.rich(
          TextSpan(
            text: data,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            children: [
              TextSpan(text: supportText, style: TextStyle(fontSize: 8)),
            ],
          ),
        ),
      ],
    );
  }
}
