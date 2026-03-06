import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
   build(BuildContext context) {
    return AppBar(
      backgroundColor:Theme.of(context).colorScheme.inversePrimary,
    );
  }
  
  @override
  Size get preferredSize => Size(200, 60);
}