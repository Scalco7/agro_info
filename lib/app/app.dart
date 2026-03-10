import 'package:agro_info/app/common/providers/dark_theme_provider.dart';
import 'package:agro_info/app/pages/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkThemeProvider>(
      builder: (_, darkThemeProvider, widget) {
        return MaterialApp(
          title: 'Agro Info',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(72, 183, 139, 1),
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(72, 183, 139, 1),
              brightness: Brightness.dark,
            ),
          ),
          themeMode: darkThemeProvider.themeMode,
          home: const AppRoute(),
        );
      },
    );
  }
}
