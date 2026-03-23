import 'package:agro_info/app/common/states/weather_state.dart';
import 'package:agro_info/app/common/viewmodels/home_viewmodel.dart';
import 'package:agro_info/app/ui/pages/home/widgets/weather/weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherStateControllerWidget extends StatelessWidget {
  const WeatherStateControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: Consumer<HomeViewmodel>(
        builder: (context, homeViewmodel, widget) {
          IWeatherState state = homeViewmodel.weatherState;

          switch (state) {
            case LoadingWeatherState():
              return Center(child: const CircularProgressIndicator());
            case FailureWeatherState():
              return Center(child: Text(state.errorMessage));
            case LoadedWeatherState():
              return WeatherWidget(weather: state.weatherData);
          }
        },
      ),
    );
  }
}
