import 'package:agro_info/app/common/models/weather/weather_forecastday_model.dart';
import 'package:flutter/material.dart';

class WeatherItemWidget extends StatelessWidget {
  final WeatherForecastdayModel dayForecast;
  const WeatherItemWidget({super.key, required this.dayForecast});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: 100, child: Placeholder());
  }
}
