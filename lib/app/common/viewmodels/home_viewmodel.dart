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
    fetchNews();
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

  void fetchNews() async {
    INewsState state = _newsState;
    int nextPage = 1;

    if (state is LoadedNewsState) {
      nextPage = state.page == state.quantityOfPages
          ? state.page
          : state.page + 1;
    }

    _emit(newsState: LoadingNewsState());

    Result newsResult = await _newsService.getAggricultureLastNews(
      page: nextPage,
      pageSize: INewsState.pageSize,
    );

    switch (newsResult) {
      case Success(value: var newsData):
        int quantityOfPages =
            ((newsData as NewsResponseModel).totalResults / INewsState.pageSize)
                .ceil();
        _emit(
          newsState: LoadedNewsState(
            newsData,
            page: nextPage,
            quantityOfPages: quantityOfPages,
          ),
        );
        break;
      case Failure(error: var error):
        _emit(newsState: FailureNewsState(error.toString()));
        break;
    }
  }
}
