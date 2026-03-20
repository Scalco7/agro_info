import 'package:agro_info/app/common/models/weather/weather_forecast_response_model.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherForecastResponseModel weather;
  const WeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 240, child: Placeholder());
  }
}