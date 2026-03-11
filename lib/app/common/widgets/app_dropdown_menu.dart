import 'package:flutter/material.dart';

class AppDropdownMenu<T> extends StatelessWidget {
  final void Function(T?)? onSelected;
  final List<DropdownMenuEntry<T>>? dropdownMenuEntries;
  final TextEditingController? controller;
  final Widget? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? menuHeight;
  final String loadingText;
  final String emptyText;
  final bool enableSearch;
  final bool enable;

  const AppDropdownMenu({
    super.key,
    this.onSelected,
    this.dropdownMenuEntries,
    this.controller,
    this.label,
    this.hintText,
    this.errorText,
    this.helperText,
    this.suffix,
    this.suffixIcon,
    this.prefixIcon,
    this.menuHeight,
    this.loadingText = "Carregando...",
    this.emptyText = "Nenhuma opção dsponível",
    this.enableSearch = false,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isLoading = dropdownMenuEntries == null;
    bool isEmpty = dropdownMenuEntries != null && dropdownMenuEntries!.isEmpty;
    Widget? widgetLabel = enable
        ? isLoading
              ? Text(loadingText)
              : isEmpty
              ? Text(emptyText)
              : label
        : label;

    return DropdownMenu<T>(
      onSelected: onSelected,
      expandedInsets: EdgeInsets.zero,
      dropdownMenuEntries: isLoading || isEmpty ? [] : dropdownMenuEntries!,
      controller: controller,
      enableSearch: enableSearch,
      requestFocusOnTap: enableSearch,
      enabled: enable && !isLoading && !isEmpty,
      menuHeight: menuHeight,
      decorationBuilder: (context, controller) => InputDecoration(
        label: widgetLabel,
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
