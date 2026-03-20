import 'package:agro_info/app/common/resources/result.dart';
import 'package:agro_info/app/common/services/location_service.dart';
import 'package:agro_info/app/common/services/weather_service.dart';
import 'package:agro_info/app/common/states/weather_state.dart';
import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  final IWeatherService _weatherService;
  final ILocationService _locationService;

  IWeatherState _weatherState = LoadingWeatherState();
  IWeatherState get weatherState => _weatherState;

  HomeViewmodel({
    required IWeatherService weatherService,
    required ILocationService locationService,
  }) : _weatherService = weatherService,
       _locationService = locationService {
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
}
