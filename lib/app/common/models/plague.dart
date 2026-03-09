import 'package:agro_info/app/common/models/culture.dart';

class Plague {
  final String classification;
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
    classification: json["classificacao"],
    cientificName: json["nome_cientifico"],
    comumName: (json["nome_comum"] as List<dynamic>)
        .map((name) => name.toString())
        .toList(),
    culture: ((json["cultura"]) as List<dynamic>)
        .map((json) => Culture.fromJson(json))
        .toList(),
  );
}
