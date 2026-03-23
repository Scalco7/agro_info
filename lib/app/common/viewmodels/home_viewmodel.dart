import 'package:agro_info/app/common/models/news/news_model.dart';
import 'package:agro_info/app/common/models/news/news_response_model.dart';
import 'package:agro_info/app/common/resources/result.dart';
import 'package:agro_info/app/common/services/location_service.dart';
import 'package:agro_info/app/common/services/news_service.dart';
import 'package:agro_info/app/common/services/weather_service.dart';
import 'package:agro_info/app/common/states/news_state.dart';
import 'package:agro_info/app/common/states/weather_state.dart';
import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  final IWeatherService _weatherService;
  final ILocationService _locationService;
  final INewsService _newsService;

  IWeatherState _weatherState = LoadingWeatherState();
  IWeatherState get weatherState => _weatherState;

  INewsState _newsState = LoadingNewsState();
  INewsState get newsState => _newsState;

  HomeViewmodel({
    required IWeatherService weatherService,
    required ILocationService locationService,
    required INewsService newsService,
  }) : _weatherService = weatherService,
       _locationService = locationService,
       _newsService = newsService {
    fetchForecasts();
    _initFetchNews();
  }

  void _emit({IWeatherState? weatherState, INewsState? newsState}) {
    if (weatherState != null) {
      _weatherState = weatherState;
    }

    if (newsState != null) {
      _newsState = newsState;
    }

    notifyListeners();
  }

  void fetchForecasts() async {
    _emit(weatherState: LoadingWeatherState());

    Result positionResult = await _locationService.determinePosition();

    if (positionResult is Failure) {
      _emit(weatherState: FailureWeatherState(positionResult.error.toString()));
      return;
    }

    var forecastResult = await _weatherService.getForecast(
      position: (positionResult as Success).value,
    );

    switch (forecastResult) {
      case Success(value: var weather):
        _emit(weatherState: LoadedWeatherState(weather));
        break;
      case Failure(error: var error):
        _emit(weatherState: FailureWeatherState(error.toString()));
        break;
    }
  }

  void loadNewNews() async {
    INewsState state = _newsState;

    if (state is! LoadedNewsState) {
      _emit(
        newsState: FailureNewsState(
          "Não é possível aumentar uma lista sem nada.",
        ),
      );
      return;
    }

    if (state.isLoadingMore) {
      return;
    }

    if (state.page == state.quantityOfPages) {
      return;
    }

    int nextPage = state.page + 1;

    _emit(newsState: state.copyWith(isLoadingMore: true));

    Result newsResult = await _newsService.getAggricultureLastNews(
      page: nextPage,
      pageSize: INewsState.pageSize,
    );

    if (newsResult is Success) {
      int quantityOfPages =
          (newsResult.value.totalResults / INewsState.pageSize).ceil();

      List<NewsModel> newsList = [
        ...state.newsList,
        ...newsResult.value.articles,
      ];

      _emit(
        newsState: LoadedNewsState(
          newsList,
          page: nextPage,
          quantityOfPages: quantityOfPages,
        ),
      );
    }
  }

  void _getAggricultureLastNews(
    int page, [
    List<NewsModel>? preexistingList,
  ]) async {
    Result newsResult = await _newsService.getAggricultureLastNews(
      page: 1,
      pageSize: INewsState.pageSize,
    );

    switch (newsResult) {
      case Success(value: var newsData):
        int quantityOfPages =
            ((newsData as NewsResponseModel).totalResults / INewsState.pageSize)
                .ceil();
        List<NewsModel>? newList = preexistingList == null
            ? newsData.articles
            : [...preexistingList, ...newsData.articles];
        _emit(
          newsState: LoadedNewsState(
            newList,
            page: 1,
            quantityOfPages: quantityOfPages,
          ),
        );
        break;
      case Failure(error: var error):
        _emit(newsState: FailureNewsState(error.toString()));
        break;
    }
  }

  void _initFetchNews() async {
    _emit(newsState: LoadingNewsState());
    _getAggricultureLastNews(1);
  }
}
