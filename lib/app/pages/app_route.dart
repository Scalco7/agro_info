import 'package:agro_info/app/pages/plague/plague_page.dart';
import 'package:agro_info/app/pages/plantingZone/planting_zone_page.dart';
import 'package:flutter/material.dart';

class AppRoute extends StatelessWidget {
  const AppRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/plagues",
      onGenerateRoute: (settings) {
        if (settings.name == "/zarc-calc") {
          return MaterialPageRoute(
            builder: (context) => const PlantingZonePage(),
          );
        } else {
          return MaterialPageRoute(builder: (context) => const PlaguePage());
        }
      },
    );
  }
}
