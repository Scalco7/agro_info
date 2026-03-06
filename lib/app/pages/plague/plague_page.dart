import 'package:agro_info/app/common/models/plague.dart';
import 'package:agro_info/app/common/widgets/app_bar.dart';
import 'package:agro_info/app/common/widgets/bottom_navigation_bar.dart';
import 'package:agro_info/app/pages/plague/widgets/plague_widget.dart';
import 'package:flutter/material.dart';

var mockedPlague1 = Plague(classification: 'Doença', cientificName: "Nome cientifico", comumName: ["Virus X"], culture: []);
var mockedPlague2 = Plague(classification: 'Insetos', cientificName: "Nome cientifico", comumName: ["Gafanhotos"], culture: []);

class PlaguePage extends StatelessWidget {
  const PlaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pragas', icon: Icons.bug_report_outlined),
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Column(
        children: [
          Container(),
          Flex(spacing: 20, direction: Axis.horizontal, children: [PlagueWidget(plague: mockedPlague1), PlagueWidget(plague: mockedPlague2)],),
        ],
      ),
    );
  }
}
