import 'package:agro_info/app/common/models/zonig_result.dart';
import 'package:agro_info/app/common/services/agritec_service.dart';
import 'package:agro_info/app/common/widgets/app_bar.dart';
import 'package:agro_info/app/common/widgets/bottom_navigation_bar.dart';
import 'package:agro_info/app/pages/planting_zone/widgets/calculation_form.dart';
import 'package:flutter/material.dart';

class PlantingZonePage extends StatefulWidget {
  final IAgriTecService agriTecService = AgriTecService();
  PlantingZonePage({super.key});

  @override
  State<PlantingZonePage> createState() => _PlantingZonePageState();
}

class _PlantingZonePageState extends State<PlantingZonePage> {
  ZoningResult? zoningResult;

  void handleOnCalcRisk({
    required int ibgeCode,
    required String risk,
    required int cropId,
  }) async {
    ZoningResult newResult = await widget.agriTecService.calcZone(
      cropId: cropId,
      ibgeCode: ibgeCode,
      risk: risk,
    );

    print(newResult.toJson());

    setState(() {
      zoningResult = newResult;
    });
  }

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
        child: Column(
          spacing: 40,
          children: [
            CalculationForm(onCalcRisk: handleOnCalcRisk),
            Text("Risco ${zoningResult?.risk.toString() ?? 0}%"),
          ],
        ),
      ),
    );
  }
}
