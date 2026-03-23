import 'package:agro_info/app/common/models/news/news_model.dart';

sealed class INewsState {
  static final int pageSize = 10;
}

class LoadingNewsState implements INewsState {}

class LoadedNewsState implements INewsState {
  final List<NewsModel> newsList;
  final int page;
  final int quantityOfPages;
  final bool isLoadingMore;

  LoadedNewsState(
    this.newsList, {
    required this.page,
    required this.quantityOfPages,
    this.isLoadingMore = false,
  });

  LoadedNewsState copyWith({
    List<NewsModel>? newsList,
    int? page,
    int? quantityOfPages,
    bool? isLoadingMore,
  }) {
    return LoadedNewsState(
      newsList ?? this.newsList,
      page: page ?? this.page,
      quantityOfPages: quantityOfPages ?? this.quantityOfPages,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class FailureNewsState implements INewsState {
  final String errorMessage;

  FailureNewsState(this.errorMessage);
}
