class AgrofitCrop {
  final String name;
  final String urlAgroFit;

  AgrofitCrop({required this.name, required this.urlAgroFit});

  factory AgrofitCrop.fromJson(Map<String, dynamic> json) => AgrofitCrop(name: json["nome"], urlAgroFit: json["url_agrofit"]);
}
