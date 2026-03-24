import 'package:flutter/material.dart';

class MarketWidget extends StatelessWidget {
  const MarketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: colorScheme.tertiaryFixed, width: 4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            "Mercado",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          
          ),
          Placeholder(),
        ],
      ),
    );
  }
}
