import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.3), spreadRadius: 2, blurRadius: 20)],
      ),
      clipBehavior: Clip.hardEdge,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.inverseSurface,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight(600)),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report_outlined),
            label: "Pragas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.agriculture_outlined),
            label: "Plantio",
          ),
        ],
      ),
    );
  }
}
