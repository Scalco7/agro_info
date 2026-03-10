import 'package:agro_info/app/common/widgets/app_bar.dart';
import 'package:agro_info/app/common/widgets/bottom_navigation_bar.dart';
import 'package:agro_info/app/pages/plague/widgets/plague_list.dart';
import 'package:agro_info/app/pages/plague/widgets/search_container.dart';
import 'package:flutter/material.dart';

class PlaguePage extends StatelessWidget {
  const PlaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pragas', icon: Icons.bug_report_outlined),
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: CustomBottomNavigationBar(index: 0),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          spacing: 20,
          children: [
            SearchContainer(),
            PlagueList(),
          ],
        ),
      ),
    );
  }
}
