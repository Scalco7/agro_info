import 'package:agro_info/app/app.dart';
import 'package:agro_info/app/common/providers/dark_theme_provider.dart';
import 'package:agro_info/app/common/providers/plague_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PlagueProvider()),
      ChangeNotifierProvider(create: (_) => DarkThemeProvider())
    ], 
    child: const MyApp(),
  ));
}
