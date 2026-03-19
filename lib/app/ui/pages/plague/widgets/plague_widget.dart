import 'package:agro_info/app/common/enums/plague_classification.dart';
import 'package:agro_info/app/common/models/plague.dart';
import 'package:agro_info/app/ui/pages/plague/widgets/plague_icon_widget.dart';
import 'package:flutter/material.dart';

class PlagueWidget extends StatelessWidget {
  final Plague plague;
  final double padding;
  final void Function()? onPlagueClicked;
  const PlagueWidget({super.key, required this.plague, this.onPlagueClicked, this.padding = 10});

  @override
  Widget build(BuildContext context) {
    final plagueName = plague.comumName[0] == "-"
        ? plague.cientificName
        : plague.comumName[0];
    final theme = Theme.of(context);
    final isDoenca = plague.classification == PlagueClassification.doenca;

    final backgroundColor = isDoenca
        ? theme.colorScheme.tertiaryContainer
        : theme.colorScheme.secondaryContainer;

    final contentColor = isDoenca
        ? theme.colorScheme.onTertiaryContainer
        : theme.colorScheme.onSecondaryContainer;

    return AnimatedPadding(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(padding),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPlagueClicked,
          child: Container(
            width: 100,
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                PlagueIconWidget(
                  plagueCientificName: plague.cientificName,
                  plagueClassification: plague.classification,
                  color: contentColor,
                ),
                Text(
                  plagueName,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: contentColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
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
