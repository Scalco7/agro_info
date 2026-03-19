import 'package:flutter/material.dart';

class ListTextItem extends StatelessWidget {
  final String title;
  final String text;
  const ListTextItem({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
        Text(text),
      ],
    );
  }
}