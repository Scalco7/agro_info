import 'package:agro_info/app/common/providers/plague_provider.dart';
import 'package:agro_info/app/pages/plague/widgets/plague_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PlagueList extends StatelessWidget {
  final String searchTerm;
  const PlagueList({super.key, this.searchTerm = ""});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<PlagueProvider>(
        builder: (_, plagueProvider, widget) {
          if (plagueProvider.plagues == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Lottie.asset(
                  "assets/animations/inchworm_animation.json",
                  fit: BoxFit.contain,
                  alignment: AlignmentGeometry.center,
                  repeat: true,
                  width: 200,
                ),
                Text(
                  "Carregando...",
                  style: TextStyle(fontWeight: FontWeight(500), fontSize: 16),
                ),
              ],
            );
          } else if (plagueProvider.plagues!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  "Nenhuma praga encontrada!",
                  style: TextStyle(fontWeight: FontWeight(500), fontSize: 16),
                ),
                if (plagueProvider.searchController.text.isNotEmpty)
                  ElevatedButton(
                    onPressed: () {
                      plagueProvider.searchController.clear();
                    },
                    child: Text("Limpar Busca"),
                  ),
              ],
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
              ),
              itemCount: plagueProvider.plagues!.length,
              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 0),
              itemBuilder: (context, index) =>
                  PlagueWidget(plague: plagueProvider.plagues![index]),
            );
          }
        },
      ),
    );
  }
}
