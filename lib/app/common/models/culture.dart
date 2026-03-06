class Culture {
  final String name;
  final String urlAgroFit;

  Culture({required this.name, required this.urlAgroFit});

  factory Culture.fromJson(Map<String, dynamic> json) => Culture(name: json["nome"], urlAgroFit: json["url_agrofit"]);
}
