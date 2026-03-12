import 'package:agro_info/app/common/models/zonig_result.dart';
import 'package:flutter/material.dart';

class PlantingDatesCard extends StatefulWidget {
  final ZoningResult zoningResult;
  const PlantingDatesCard({super.key, required this.zoningResult});

  @override
  State<PlantingDatesCard> createState() => _PlantingDatesCardState();
}

class _PlantingDatesCardState extends State<PlantingDatesCard> {
  double boxOpacity = 0;
  double rotateX = 3.14159;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          boxOpacity = 1;
          rotateX = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isLarge = mediaQuery.size.width > 1024;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 500, maxHeight: 300),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: boxOpacity,
          curve: Curves.easeIn,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            transformAlignment: AlignmentGeometry.center,
            transform: Matrix4.identity()..rotateX(rotateX),
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
                    widget.zoningResult.crop,
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
                        Text("Safra: ${widget.zoningResult.cropHarvest}"),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 6,
                      children: [
                        Icon(Icons.agriculture_outlined, size: 18),
                        Text("Cultivo: ${widget.zoningResult.cropCultivation}"),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 6,
                      children: [
                        Icon(Icons.landslide_outlined, size: 18),
                        Text("Solo: ${widget.zoningResult.ground}"),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 6,
                      children: [
                        Icon(Icons.autorenew_outlined, size: 18),
                        Text("Ciclo: ${widget.zoningResult.cycle}"),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text("Risco: ${widget.zoningResult.risk}%"),
                    Center(
                      child: Text(
                        "Plantio: ${widget.zoningResult.startDay.toString().padLeft(2, "0")}/${widget.zoningResult.startMonth.toString().padLeft(2, "0")} até ${widget.zoningResult.endDay.toString().padLeft(2, "0")}/${widget.zoningResult.endMonth.toString().padLeft(2, "0")}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
