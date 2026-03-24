import 'package:agro_info/app/ui/pages/home/widgets/market/market_state_controller_widget.dart';
import 'package:agro_info/app/ui/pages/home/widgets/news/news_state_controller_widget.dart';
import 'package:agro_info/app/ui/pages/home/widgets/weather/weather_state_controller_widget.dart';
import 'package:agro_info/app/ui/widgets/app_bar.dart';
import 'package:agro_info/app/ui/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Olá Agricultor',
        icon: Icon(Icons.home_outlined, size: 26),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: CustomBottomNavigationBar(index: 0),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              spacing: 20,
              children: [
                WeatherStateControllerWidget(),
                NewsStateControllerWidget(),
                MarketStateControllerWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
