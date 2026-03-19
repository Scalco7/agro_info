import 'package:agro_info/app/common/models/plague.dart';
import 'package:agro_info/app/ui/widgets/app_bar.dart';
import 'package:agro_info/app/ui/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class PlagueDetailsPage extends StatelessWidget {
  final Plague plague;
  const PlagueDetailsPage({super.key, required this.plague});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: CustomAppBar(title: plague.name, icon: Icons.bug_report_outlined),
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: CustomBottomNavigationBar(index: 0),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(spacing: 20, children: [
           
          ],
        ),
      ),
    );
  }
}
