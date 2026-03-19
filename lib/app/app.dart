import 'package:agro_info/app/common/providers/dark_theme_provider.dart';
import 'package:agro_info/app/common/utils/agro_theme.dart';
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
          debugShowCheckedModeBanner: false,
          title: 'Agro Info',
          theme: AgroTheme.light,
          darkTheme: AgroTheme.dark,
          themeMode: darkThemeProvider.themeMode,
          home: const AppRoute(),
        );
      },
    );
  }
}
