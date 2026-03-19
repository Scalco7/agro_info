import 'package:agro_info/app/common/enums/plague_classification.dart';
import 'package:agro_info/app/common/models/agrofit_crop.dart';

class Plague {
  final PlagueClassification classification;
  final String cientificName;
  final List<String> commonNames;
  final List<AgrofitCrop> cropies;

  Plague({
    required this.classification,
    required this.cientificName,
    required this.commonNames,
    required this.cropies,
  });

  List<String> get validNames => commonNames.where((n) => n != "-").toList();
  String get name => validNames.isEmpty ? cientificName : validNames[0];

  factory Plague.fromJson(Map<String, dynamic> json) => Plague(
    classification: PlagueClassification.fromString(json["classificacao"]),
    cientificName: json["nome_cientifico"],
    commonNames: (json["nome_comum"] as List<dynamic>)
        .map((name) => name.toString())
        .toList(),
    cropies: ((json["cultura"]) as List<dynamic>)
        .map((json) => AgrofitCrop.fromJson(json))
        .toList(),
  );
}
