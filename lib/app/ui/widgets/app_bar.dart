import 'package:agro_info/app/common/providers/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData icon;
  const CustomAppBar({super.key, required this.title, required this.icon});

  @override
  build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Row(
        spacing: 12,
        children: <Widget>[
          Icon(
            icon,
            size: 26,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          Expanded(
            child: Text(
              title,
              textWidthBasis: TextWidthBasis.parent,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight(500),
              ),
            ),
          ),
        ],
      ),
      actionsPadding: EdgeInsets.only(right: 20),
      actions: [
        Consumer<DarkThemeProvider>(
          builder: (context, darkThemeProvider, widget) {
            return IconButton(
              icon: darkThemeProvider.isDarkMode(context)
                  ? Icon(Icons.sunny, color: Colors.amber)
                  : Icon(Icons.bedtime, color: Colors.lightBlue),
              onPressed: () => darkThemeProvider.toogleThemeMode(context),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(200, 60);
}
