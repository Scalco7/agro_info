import 'package:agro_info/app/common/providers/plague_provider.dart';
import 'package:agro_info/app/pages/plague/widgets/plague_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlagueList extends StatelessWidget {
  const PlagueList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<PlagueProvider>(
        builder: (_, plagueProvider, widget) {
          if (plagueProvider.plagues == null) {
            return Center(child: Text("Erro ao carregar pragas!"));
          } else if (plagueProvider.plagues!.isEmpty) {
            return Center(child: Text("carregando pragas!"));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
              itemCount: plagueProvider.plagues!.length,
              padding: EdgeInsets.all(20),
              itemBuilder: (context, index) =>
                  PlagueWidget(plague: plagueProvider.plagues![index]),
            );
          }
        },
      ),
    );
  }
}
