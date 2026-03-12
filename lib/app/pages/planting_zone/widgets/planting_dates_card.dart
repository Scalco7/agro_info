import 'package:agro_info/app/common/models/zonig_result.dart';
import 'package:flutter/material.dart';

class PlantingDatesCard extends StatelessWidget {
  final ZoningResult zoningResult;
  const PlantingDatesCard({super.key, required this.zoningResult});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isLarge = mediaQuery.size.width > 1024;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: 300
        ),
        child: Container(
          width: isLarge ? mediaQuery.size.width * 0.35 : null,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.19),
                blurRadius: 20,
                spreadRadius: 0,
                offset: Offset(0, 10),
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.23),
                blurRadius: 6,
                spreadRadius: 0,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  zoningResult.crop,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
              GridView.extent(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 5.5,
                maxCrossAxisExtent: 280,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 6,
                    children: [
                      Icon(Icons.grass_outlined, size: 18),
                      Text("Safra: ${zoningResult.cropHarvest}"),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 6,
                    children: [
                      Icon(Icons.agriculture_outlined, size: 18),
                      Text("Cultivo: ${zoningResult.cropCultivation}"),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 6,
                    children: [
                      Icon(Icons.landslide_outlined, size: 18),
                      Text("Solo: ${zoningResult.ground}"),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 6,
                    children: [
                      Icon(Icons.autorenew_outlined, size: 18),
                      Text("Ciclo: ${zoningResult.cycle}"),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text("Risco: ${zoningResult.risk}%"),
                  Center(
                    child: Text(
                      "Plantio: ${zoningResult.startDay.toString().padLeft(2, "0")}/${zoningResult.startMonth.toString().padLeft(2, "0")} até ${zoningResult.endDay.toString().padLeft(2, "0")}/${zoningResult.endMonth.toString().padLeft(2, "0")}",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
