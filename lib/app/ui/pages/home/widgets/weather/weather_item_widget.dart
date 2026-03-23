import 'package:agro_info/app/common/models/weather/weather_forecastday_model.dart';
import 'package:agro_info/app/ui/pages/home/widgets/weather/weather_day_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherItemWidget extends StatelessWidget {
  final WeatherForecastdayModel dayForecast;
  const WeatherItemWidget({super.key, required this.dayForecast});

  @override
  Widget build(BuildContext context) {
    String formattedWeekDay = DateFormat('E', 'pt_BR').format(dayForecast.date);
    Color conditionColor = dayForecast.day.condition.condition.color;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(12),
      shadowColor: Colors.black.withValues(alpha: 0.5),
      child: Container(
        width: 140,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: conditionColor.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            Positioned(
              bottom: 0,
              left: -20,
              child: Container(
                width: 180,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(80),
                    bottom: Radius.circular(12),
                  ),
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                    stops: [0, 0.4, 1],
                    colors: [
                      conditionColor.withValues(alpha: 0.1),
                      conditionColor.withValues(alpha: 0.5),
                      conditionColor.withValues(alpha: 0.8),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    spacing: 4,
                    children: [
                      Image.network(
                        dayForecast.day.condition.iconUrl,
                        width: 50,
                        height: 50,
                      ),
                      Column(
                        spacing: 0,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "${dayForecast.day.mintempC}º",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onTertiaryContainer,
                              ),
                              children: [
                                TextSpan(
                                  text: " - ",
                                  style: TextStyle(
                                    wordSpacing: -1,
                                    fontSize: 18,
                                    color: colorScheme.onTertiaryContainer,
                                  ),
                                ),
                                TextSpan(text: "${dayForecast.day.maxtempC}º"),
                              ],
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(formattedWeekDay),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WeatherDayDetailWidget(
                        data: dayForecast.day.maxwindKph.ceil().toString(),
                        title: "Vento",
                        supportText: "km",
                        textColor: colorScheme.onTertiaryContainer,
                      ),
                      WeatherDayDetailWidget(
                        data: dayForecast.day.dailyWillItRain.ceil().toString(),
                        title: "Humidade",
                        supportText: "%",
                        textColor: colorScheme.onTertiaryContainer,
                      ),
                      WeatherDayDetailWidget(
                        data: dayForecast.day.totalprecipMm.ceil().toString(),
                        title: "Preciptação",
                        supportText: "Mm",
                        textColor: colorScheme.onTertiaryContainer,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
