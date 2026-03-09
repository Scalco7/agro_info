import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData icon;
  const CustomAppBar({super.key, required this.title, required this.icon});

  @override
  build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        spacing: 12,
        children: <Widget>[
          Icon(icon, size: 26, color: Theme.of(context).colorScheme.onPrimary),
          Text(
            title,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight(500)),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  @override
  Size get preferredSize => Size(200, 60);
}
