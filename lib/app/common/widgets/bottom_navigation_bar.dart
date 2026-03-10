import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int index;
  const CustomBottomNavigationBar({super.key, required this.index});

  void onTapRoute(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(
          context,
        ).pushReplacementNamed("/plagues");
        break;
      case 1:
        Navigator.of(
          context,
        ).pushReplacementNamed("/zarc-calc");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            spreadRadius: 2,
            blurRadius: 20,
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.inverseSurface,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight(600)),
        currentIndex: index,
        onTap: (newIndex) => onTapRoute(context, newIndex),
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
