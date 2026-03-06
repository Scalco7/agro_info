import 'package:agro_info/app/common/helpers/classification_map.dart';
import 'package:agro_info/app/common/models/plague.dart';
import 'package:flutter/material.dart';

class PlagueWidget extends StatelessWidget {
  final Plague plague;
  const PlagueWidget({super.key, required this.plague});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: BoxBorder.all(color: Colors.black, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(classificationMap[plague.classification.toLowerCase()]),
          Text(plague.comumName[0]),
        ],
      ),
    );
  }
}
