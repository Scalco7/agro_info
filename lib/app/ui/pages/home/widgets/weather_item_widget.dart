import 'package:agro_info/app/common/models/weather/weather_forecastday_model.dart';
import 'package:agro_info/app/ui/pages/home/widgets/weather_day_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherItemWidget extends StatelessWidget {
  final WeatherForecastdayModel dayForecast;
  const WeatherItemWidget({super.key, required this.dayForecast});

  @override
  Widget build(BuildContext context) {
    String formattedWeekDay = DateFormat('E', 'pt_BR').format(dayForecast.date);

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(12),
      shadowColor: Colors.black.withValues(alpha: 0.5),
      child: Container(
        width: 140,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(12),
        ),
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
                    Text(
                      "${dayForecast.day.mintempC}º - ${dayForecast.day.maxtempC}º",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
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
                ),
                WeatherDayDetailWidget(
                  data: dayForecast.day.dailyWillItRain.ceil().toString(),
                  title: "Humidade",
                  supportText: "%",
                ),
                WeatherDayDetailWidget(
                  data: dayForecast.day.totalprecipMm.ceil().toString(),
                  title: "Preciptação",
                  supportText: "Mm",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
