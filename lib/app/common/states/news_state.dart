import 'package:agro_info/app/common/models/news/news_response_model.dart';

sealed class INewsState {
  static final int pageSize = 10;
}

class LoadingNewsState implements INewsState {}

class LoadedNewsState implements INewsState {
  final NewsResponseModel newsData;
  final int page;
  final int quantityOfPages;

  LoadedNewsState(this.newsData, {required this.page, required this.quantityOfPages});
}

class FailureNewsState implements INewsState {
  final String errorMessage;

  FailureNewsState(this.errorMessage);
}