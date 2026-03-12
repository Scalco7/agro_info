import 'package:agro_info/app/common/enums/app_route_enum.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int index;
  const CustomBottomNavigationBar({super.key, required this.index});

  void onTapRoute(BuildContext context, int index) {
    AppRouteEnum appRoute = AppRouteEnum.fromIndex(index);

    Navigator.of(context).pushReplacementNamed(appRoute.name);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isLarge = mediaQuery.size.width > 720;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(isLarge ? 10 : 30),
        ),
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
            label: "Calculo de Plantio",
          ),
        ],
      ),
    );
  }
}
