import 'package:agro_info/app/common/models/news/news_model.dart';

class NewsResponseModel {
  final String status;
  final int totalResults;
  final List<NewsModel> articles;

  NewsResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    return NewsResponseModel(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: (json['articles'] as List<dynamic>)
          .map((json) => NewsModel.fromJson(json))
          .toList(),
    );
  }
}
