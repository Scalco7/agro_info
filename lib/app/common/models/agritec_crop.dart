class AgritecCrop {
  final int id;
  final String name;
  final String completeName;
  final String harvest;
  final String cultivation;
  final String climate;
  final bool hasZoning;
  final bool hasCultivate;
  final bool hasProdutivity;
  final bool hasFertilizing;
  final bool isSoy;
  final bool isWheat;
  final String? updatedAt;

  AgritecCrop({
    required this.id,
    required this.name,
    required this.completeName,
    required this.harvest,
    required this.cultivation,
    required this.climate,
    required this.hasZoning,
    required this.hasCultivate,
    required this.hasProdutivity,
    required this.hasFertilizing,
    required this.isSoy,
    required this.isWheat,
    required this.updatedAt,
  });

  factory AgritecCrop.fromJson(Map<String, dynamic> json) {
    return AgritecCrop(
      id: json["id"],
      name: json["nome"],
      completeName: json["nomeCompleto"],
      harvest: json["safra"],
      cultivation: json["cultivo"],
      climate: json["clima"],
      hasZoning: json["hasZoneamento"],
      hasCultivate: json["hasCultivar"],
      hasProdutivity: json["hasProdutividade"],
      hasFertilizing: json["hasAdubacao"],
      isSoy: json["isSoja"],
      isWheat: json["isTrigo"],
      updatedAt: json["dataAtualizacao"],
    );
  }
}
