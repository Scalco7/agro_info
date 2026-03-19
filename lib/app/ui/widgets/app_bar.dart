import 'package:agro_info/app/common/providers/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget icon;
  const CustomAppBar({super.key, required this.title, required this.icon});

  @override
  build(BuildContext context) {
    final navigator = Navigator.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textColors = colorScheme.onPrimary;

    return AppBar(
      automaticallyImplyLeading: false,
      foregroundColor: textColors,
      backgroundColor: colorScheme.primary,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: <Widget>[
          if (navigator.canPop())
            IconButton.filled(
              padding: const EdgeInsets.all(4.0),
              constraints: BoxConstraints(),
              icon: Icon(Icons.arrow_back, size: 22),
              onPressed: () => navigator.pop(),
            ),
          icon,
          Expanded(
            child: Text(
              title,
              textWidthBasis: TextWidthBasis.parent,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: textColors, fontWeight: FontWeight(500)),
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
