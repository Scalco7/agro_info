import 'package:agro_info/app/pages/app_route.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agro Info',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.lightGreenAccent),
      ),
      home: const AppRoute(),
    );
  }
}