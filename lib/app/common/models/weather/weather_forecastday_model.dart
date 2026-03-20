import 'package:agro_info/app/common/models/weather/weather_astro_model.dart';
import 'package:agro_info/app/common/models/weather/weather_day_model.dart';

class WeatherForecastdayModel {
  final DateTime date;
  final int dateEpoch;
  final WeatherDayModel day;
  final WeatherAstroModel astro;

  WeatherForecastdayModel({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
  });

  factory WeatherForecastdayModel.fromJson(Map<String, dynamic> json) {
    return WeatherForecastdayModel(
      date: json["date"],
      dateEpoch: json["date_epoch"],
      day: WeatherDayModel.fromJson(json["day"]),
      astro: WeatherAstroModel.fromJson(json["astro"]),
    );
  }
}
