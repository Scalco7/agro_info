import 'package:agro_info/app/common/models/weather/weather_current_model.dart';
import 'package:agro_info/app/common/models/weather/weather_forecastday_model.dart';
import 'package:agro_info/app/common/models/weather/weather_location_model.dart';

class WeatherForecastResponseModel {
  final WeatherLocationModel location;
  final WeatherCurrentModel current;
  final WeatherForecastModel forecast;

  WeatherForecastResponseModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherForecastResponseModel.fromJson(Map<String, dynamic> json) {
    return WeatherForecastResponseModel(
      location: WeatherLocationModel.fromJson(json["location"]),
      current: WeatherCurrentModel.fromJson(json["current"]),
      forecast: WeatherForecastModel.fromJson(json["forecast"]),
    );
  }
}

class WeatherForecastModel {
  final List<WeatherForecastdayModel> forecastday;

  WeatherForecastModel({required this.forecastday});

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    return WeatherForecastModel(
      forecastday: (json["forecastday"] as List<dynamic>)
          .map((obj) => WeatherForecastdayModel.fromJson(obj))
          .toList(),
    );
  }
}
