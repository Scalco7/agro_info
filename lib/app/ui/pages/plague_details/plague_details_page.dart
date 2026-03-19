import 'package:agro_info/app/common/models/plague.dart';
import 'package:agro_info/app/ui/pages/plague/widgets/plague_icon_widget.dart';
import 'package:agro_info/app/ui/pages/plague_details/widgets/list_text_item_widget.dart';
import 'package:agro_info/app/ui/widgets/app_bar.dart';
import 'package:agro_info/app/ui/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class PlagueDetailsPage extends StatelessWidget {
  final Plague plague;
  const PlagueDetailsPage({super.key, required this.plague});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: CustomAppBar(
        title: plague.name,
        icon: PlagueIconWidget(
          plagueCientificName: plague.cientificName,
          plagueClassification: plague.classification,
          color: colorScheme.onPrimary,
          iconSize: 26,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: CustomBottomNavigationBar(index: 0),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              ListTextItem(
                title: "Classificação:",
                text: plague.classification.apiName,
              ),
              ListTextItem(
                title: "Nome Científico:",
                text: plague.cientificName,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Nomes Communs:",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  ...plague.validNames.map((commonName) => Text(commonName)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Culturas Afetadas:",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  ...plague.cropies.map((cropie) => Text(cropie.name)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
