import 'package:agro_info/app/common/resources/result.dart';
import 'package:agro_info/app/common/services/weather_service.dart';
import 'package:agro_info/app/common/states/weather_state.dart';
import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  final WeatherService _weatherService;

  IWeatherState _weatherState = LoadingWeatherState();
  IWeatherState get weatherState => _weatherState;

  HomeViewmodel(this._weatherService) {
    fetchForecasts();
  }

  void _emit({IWeatherState? weatherState}) {
    if (weatherState != null) {
      _weatherState = weatherState;
    }

    notifyListeners();
  }

  void fetchForecasts() async {
    _emit(weatherState: LoadingWeatherState());

    var forecastResult = await _weatherService.getForecast();

    switch (forecastResult) {
      case Success(value: var weather):
        _emit(weatherState: LoadedWeatherState(weather));
        break;
      case Failure(error: var error):
        _emit(weatherState: FailureWeatherState(error.toString()));
        break;
    }
  }
}
