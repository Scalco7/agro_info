import 'dart:convert';

import 'package:agro_info/app/common/enums/api_key_type.dart';
import 'package:agro_info/app/common/models/news/news_response_model.dart';
import 'package:agro_info/app/common/resources/result.dart';
import 'package:agro_info/app/common/services/api_service.dart';
import 'package:http/http.dart';

abstract class INewsService {
  Future<Result<NewsResponseModel, Exception>> getAggricultureLastNews({
    required int page,
  });
}

class NewsService implements INewsService {
  static final NewsService _instance = NewsService._internal();
  static const String _apiUrl = "https://newsapi.org/v2/";
  final IApiService apiService = ApiService();

  NewsService._internal();
  factory NewsService() => _instance;

  @override
  Future<Result<NewsResponseModel, Exception>> getAggricultureLastNews({
    required int page,
  }) async {
    Uri uri = Uri.parse(
      "$_apiUrl/everything?q=agro&language=pt&sortBy=publishedAt&page=$page&pageSize=10",
    );
    try {
      Response response = await apiService.get(
        uri,
        apiKeyType: ApiKeyType.newsApi,
      );
      var decodedData = jsonDecode(response.body.toString());
      if (response.statusCode != 200) {
        throw Exception("Erro ao buscar notícias");
      }

      NewsResponseModel formattedResponse = NewsResponseModel.fromJson(
        decodedData,
      );
      return Success(formattedResponse);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
