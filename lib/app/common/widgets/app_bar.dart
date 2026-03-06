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
        children: <Widget>[Icon(icon), Text(title)],
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }

  @override
  Size get preferredSize => Size(200, 60);
}
