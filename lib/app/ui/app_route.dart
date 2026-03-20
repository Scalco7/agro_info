import 'package:agro_info/app/common/enums/app_route_enum.dart';
import 'package:agro_info/app/common/models/plague.dart';
import 'package:agro_info/app/ui/pages/home/home_page.dart';
import 'package:agro_info/app/ui/pages/plague/plague_page.dart';
import 'package:agro_info/app/ui/pages/plague_details/plague_details_page.dart';
import 'package:agro_info/app/ui/pages/planting_zone/planting_zone_page.dart';
import 'package:agro_info/app/ui/pages/splash/splash.dart';
import 'package:flutter/material.dart';

class AppRoute extends StatelessWidget {
  const AppRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: AppRouteEnum.splash.name,
      onGenerateRoute: (settings) {
        if (settings.name == null) {
          return MaterialPageRoute(builder: (context) => const SplashPage());
        }

        AppRouteEnum currentAppRoute = AppRouteEnum.fromName(settings.name!);
        switch (currentAppRoute) {
          case AppRouteEnum.home:
            return MaterialPageRoute(builder: (context) => const HomePage());
          case AppRouteEnum.plague:
            return MaterialPageRoute(builder: (context) => const PlaguePage());
          case AppRouteEnum.zarcCalc:
            return MaterialPageRoute(builder: (context) => PlantingZonePage());
          case AppRouteEnum.splash:
            return MaterialPageRoute(builder: (context) => const SplashPage());
          case AppRouteEnum.plagueDetails:
            return MaterialPageRoute(
              builder: (context) =>
                  PlagueDetailsPage(plague: settings.arguments! as Plague),
            );
        }
      },
    );
  }
}
