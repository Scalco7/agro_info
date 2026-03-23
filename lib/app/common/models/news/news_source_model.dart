class NewsSourceModel {
  final String? id;
  final String name;

  NewsSourceModel({required this.id, required this.name});

  factory NewsSourceModel.fromJson(Map<String, dynamic> json) {
    return NewsSourceModel(id: json["id"], name: json["name"]);
  }
}
