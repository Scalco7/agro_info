import 'package:agro_info/app/common/models/news/news_source_model.dart';

class NewsModel {
  final String? author;
  final String? title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;
  final NewsSourceModel source;

  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.source,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: DateTime.parse(json["publishedAt"] as String),
      content: json["content"],
      source: NewsSourceModel.fromJson(json["source"]),
    );
  }
}
