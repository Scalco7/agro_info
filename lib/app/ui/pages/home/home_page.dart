import 'package:agro_info/app/common/services/weather_service.dart';
import 'package:agro_info/app/ui/pages/home/widgets/weather_state_controller_widget.dart';
import 'package:agro_info/app/ui/widgets/app_bar.dart';
import 'package:agro_info/app/ui/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final WeatherService _weatherService = WeatherService();
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    _weatherService.getForecast(days: 5);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Olá Agricultor',
        icon: Icon(Icons.home_outlined, size: 26),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: CustomBottomNavigationBar(index: 0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            spacing: 20,
            children: [
              WeatherStateControllerWidget(),
              SizedBox(height: 200, child: Placeholder()),
              Placeholder(),
            ],
          ),
        ),
      ),
    );
  }
}
