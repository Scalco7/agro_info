import 'package:agro_info/app/common/enums/plague_classification.dart';
import 'package:agro_info/app/common/models/plague.dart';
import 'package:flutter/material.dart';

class PlagueWidget extends StatelessWidget {
  final Plague plague;
  final double padding;
  const PlagueWidget({super.key, required this.plague, this.padding = 10});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
      padding: EdgeInsets.all(padding),
      child: GestureDetector(
        child: Container(
          width: 100,
          height: 80,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: plague.classification == PlagueClassification.doenca
                ? Theme.of(context).colorScheme.errorContainer
                : Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                blurRadius: 6,
                spreadRadius: 0,
                offset: Offset(0, 3),
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.23),
                blurRadius: 6,
                spreadRadius: 0,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 4,
              children: [
                Icon(
                  plague.icon,
                  size: 30,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                Text(
                  plague.comumName[0],
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
