import 'package:flutter/material.dart';

class AppDropdownMenu<T> extends StatelessWidget {
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final TextEditingController? controller;
  final Widget? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const AppDropdownMenu({
    super.key,
    required this.dropdownMenuEntries,
    this.controller,
    this.label,
    this.hintText,
    this.errorText,
    this.helperText,
    this.suffix,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      expandedInsets: EdgeInsets.zero,
      dropdownMenuEntries: dropdownMenuEntries,
      controller: controller,
      decorationBuilder: (context, controller) => InputDecoration(
        label: label,
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffix: suffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
