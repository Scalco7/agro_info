import 'package:agro_info/app/common/enums/plague_classification.dart';
import 'package:agro_info/app/common/models/culture.dart';
import 'package:flutter/material.dart';

class Plague {
  final PlagueClassification classification;
  final String cientificName;
  final List<String> comumName;
  final List<Culture> culture;

  Plague({
    required this.classification,
    required this.cientificName,
    required this.comumName,
    required this.culture,
  });

  factory Plague.fromJson(Map<String, dynamic> json) => Plague(
    classification: PlagueClassification.fromString(json["classificacao"]),
    cientificName: json["nome_cientifico"],
    comumName: (json["nome_comum"] as List<dynamic>)
        .map((name) => name.toString())
        .toList(),
    culture: ((json["cultura"]) as List<dynamic>)
        .map((json) => Culture.fromJson(json))
        .toList(),
  );

  IconData get icon {
    String name = comumName[0].toLowerCase();
    switch (classification) {
      case PlagueClassification.doenca:
        return Icons.coronavirus_outlined;
      case PlagueClassification.insetos:
        switch (name) {
          case _ when name.contains("abelha"):
            return Icons.emoji_nature_outlined;
          default:
            return Icons.pest_control_outlined;
        }
    }
  }
}
