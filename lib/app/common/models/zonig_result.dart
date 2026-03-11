class ZoningResult {
  final String city;
  final String state;
  final String crop;
  final String cropCompleteName;
  final String cropHarvest;
  final String cropCultivation;
  final String cropClimate;
  final String cycle;
  final String ground;
  final int startDay;
  final int startMonth;
  final int endDay;
  final int endMonth;
  final int harvestStart;
  final int harvestEnd;
  final int risk;
  final String ordinance;

  ZoningResult({
    required this.city,
    required this.state,
    required this.crop,
    required this.cropCompleteName,
    required this.cropHarvest,
    required this.cropCultivation,
    required this.cropClimate,
    required this.cycle,
    required this.ground,
    required this.startDay,
    required this.startMonth,
    required this.endDay,
    required this.endMonth,
    required this.harvestStart,
    required this.harvestEnd,
    required this.risk,
    required this.ordinance,
  });

  factory ZoningResult.fromJson(Map<String, dynamic> json) {
    return ZoningResult(
      city: json["municipio"],
      state: json["uf"],
      crop: json["cultura"],
      cropCompleteName: json["culturaNomeCompleto"],
      cropHarvest: json["culturaSafra"],
      cropCultivation: json["culturaCultivo"],
      cropClimate: json["culturaClima"],
      cycle: json["ciclo"],
      ground: json["solo"],
      startDay: json["diaIni"],
      startMonth: json["mesIni"],
      endDay: json["diaFim"],
      endMonth: json["mesFim"],
      harvestStart: json["safraIni"],
      harvestEnd: json["safraFim"],
      risk: json["risco"],
      ordinance: json["portaria"],
    );
  }
}
