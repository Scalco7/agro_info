import 'package:agro_info/app/common/services/agritec_service.dart';
import 'package:agro_info/app/common/states/planting_zone_state.dart';
import 'package:agro_info/app/common/viewmodels/planting_zone_viewmodel.dart';
import 'package:agro_info/app/ui/widgets/app_bar.dart';
import 'package:agro_info/app/ui/widgets/bottom_navigation_bar.dart';
import 'package:agro_info/app/ui/pages/planting_zone/widgets/calculation_form.dart';
import 'package:agro_info/app/ui/pages/planting_zone/widgets/loading_card_widget.dart';
import 'package:agro_info/app/ui/pages/planting_zone/widgets/planting_dates_card.dart';
import 'package:agro_info/app/ui/pages/planting_zone/widgets/query_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlantingZonePage extends StatelessWidget {
  final IAgriTecService agriTecService = AgriTecService();
  PlantingZonePage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isLarge = mediaQuery.size.width > 1024;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Calculo de Datas de Plantio',
        icon: Icon(Icons.agriculture_outlined, size: 26),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: CustomBottomNavigationBar(index: 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: SizedBox(
            width: mediaQuery.size.width,
            child: Consumer<PlantingZoneViewmodel>(
              builder: (context, plantingZoneViewmodel, widget) {
                IPlantingZoneState state = plantingZoneViewmodel.state;
                return Flex(
                  direction: isLarge ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 40,
                  children: [
                    CalculationForm(
                      onCalcDates:
                          plantingZoneViewmodel.getPlantingDateByFailingRisk,
                    ),
                    if (state is! InitialPlantingZoneState)
                      switch (state) {
                        InitialPlantingZoneState() => const SizedBox.shrink(),
                        LoadedPlantingZoneState loadedState =>
                          PlantingDatesCard(
                            zoningResult: loadedState.zoningData,
                          ),
                        LoadingPlantingZoneState _ => LoadingCardWidget(),
                        FailurePlantingZoneState failure => QueryErrorWidget(
                          errorMessage: failure.errorMessage,
                        ),
                      },
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
