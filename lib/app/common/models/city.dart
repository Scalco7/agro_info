class City {
  final int ibgeCode;
  final String name;
  final String state;
  final double? latitude;
  final double? longitude;
  final String soyRegion;
  final String wheatRegion;
  final String? updatedAt;

  City({
    required this.ibgeCode,
    required this.name,
    required this.state,
    required this.latitude,
    required this.longitude,
    required this.soyRegion,
    required this.wheatRegion,
    required this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      ibgeCode: json["codigoIBGE"],
      name: json["nome"],
      state: json["uf"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      soyRegion: json["regiaoSoja"],
      wheatRegion: json["regiaoTrigo"],
      updatedAt: json["dataAtualizacao"],
    );
  }
}
