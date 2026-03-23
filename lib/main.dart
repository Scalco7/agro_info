import 'package:agro_info/app/app.dart';
import 'package:agro_info/app/common/providers/dark_theme_provider.dart';
import 'package:agro_info/app/common/services/agritec_service.dart';
import 'package:agro_info/app/common/services/agrofit_service.dart';
import 'package:agro_info/app/common/services/location_service.dart';
import 'package:agro_info/app/common/services/news_service.dart';
import 'package:agro_info/app/common/services/weather_service.dart';
import 'package:agro_info/app/common/viewmodels/home_viewmodel.dart';
import 'package:agro_info/app/common/viewmodels/plague_viewmodel.dart';
import 'package:agro_info/app/common/viewmodels/planting_zone_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await initializeDateFormatting('pt_BR', null);
  Intl.defaultLocale = 'pt_BR';

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewmodel(
            weatherService: WeatherService(),
            locationService: LocationService(),
            newsService: NewsService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PlagueViewmodel(AgroFitService()),
        ),
        ChangeNotifierProvider(
          create: (_) => PlantingZoneViewmodel(AgriTecService()),
        ),
        ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
