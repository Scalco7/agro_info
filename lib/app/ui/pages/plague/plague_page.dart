import 'package:agro_info/app/ui/widgets/app_bar.dart';
import 'package:agro_info/app/ui/widgets/bottom_navigation_bar.dart';
import 'package:agro_info/app/ui/pages/plague/widgets/plague_list.dart';
import 'package:agro_info/app/ui/pages/plague/widgets/search_container.dart';
import 'package:flutter/material.dart';

class PlaguePage extends StatelessWidget {
  const PlaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Pragas',
        icon: Icon(Icons.bug_report_outlined, size: 26),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: CustomBottomNavigationBar(index: 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(spacing: 20, children: [SearchContainer(), PlagueList()]),
      ),
    );
  }
}
