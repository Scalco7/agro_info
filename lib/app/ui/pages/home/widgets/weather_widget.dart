import 'package:agro_info/app/common/models/weather/weather_forecast_response_model.dart';
import 'package:agro_info/app/ui/pages/home/widgets/weather_item_widget.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherForecastResponseModel weather;
  const WeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: colorScheme.tertiaryFixed, width: 4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${weather.location.name} - ${weather.current.tempC}ºC",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Text(weather.current.condition.text),
                ],
              ),
              Image.network(weather.current.condition.iconUrl, width: 48, height: 48),
            ],
          ),
          SizedBox(
            height: 180,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 16,
                children: weather.forecast.forecastday
                    .map(
                      (dayForecast) =>
                          WeatherItemWidget(dayForecast: dayForecast),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
