import 'package:agro_info/app/pages/plague/plague_page.dart';
import 'package:flutter/material.dart';

class AppRoute extends StatelessWidget{
  const AppRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/plagues",
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
              builder: (context) => const PlaguePage(),
            );
      },
    );
  }
}