import 'package:agro_info/app/common/widgets/app_bar.dart';
import 'package:agro_info/app/common/widgets/bottom_navigation_bar.dart';
import 'package:agro_info/app/pages/planting_zone/widgets/calculation_form.dart';
import 'package:flutter/material.dart';

class PlantingZonePage extends StatelessWidget {
  const PlantingZonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Calculo de Risco',
        icon: Icons.agriculture_outlined,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: CustomBottomNavigationBar(index: 1),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 10,
          right: 10,
          bottom: 20,
        ),
        child: CalculationForm(),
      ),
    );
  }
}
