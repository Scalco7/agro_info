import 'package:agro_info/app/common/enums/plague_classification.dart';
import 'package:agro_info/app/common/models/agrofit_crop.dart';

class Plague {
  final PlagueClassification classification;
  final String cientificName;
  final List<String> comumName;
  final List<AgrofitCrop> crop;

  Plague({
    required this.classification,
    required this.cientificName,
    required this.comumName,
    required this.crop,
  });

  String get name => comumName[0] == "-" ? cientificName : comumName[0];

  factory Plague.fromJson(Map<String, dynamic> json) => Plague(
    classification: PlagueClassification.fromString(json["classificacao"]),
    cientificName: json["nome_cientifico"],
    comumName: (json["nome_comum"] as List<dynamic>)
        .map((name) => name.toString())
        .toList(),
    crop: ((json["cultura"]) as List<dynamic>)
        .map((json) => AgrofitCrop.fromJson(json))
        .toList(),
  );
}
