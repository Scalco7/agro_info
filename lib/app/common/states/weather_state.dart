import 'package:agro_info/app/common/models/weather/weather_forecast_response_model.dart';

sealed class IWeatherState {}

class LoadingWeatherState implements IWeatherState {}

class LoadedWeatherState implements IWeatherState {
  final WeatherForecastResponseModel weatherData;

  LoadedWeatherState(this.weatherData);
}

class FailureWeatherState implements IWeatherState {
  final String errorMessage;

  FailureWeatherState(this.errorMessage);
}
