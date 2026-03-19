import 'package:agro_info/app/common/viewmodels/plague_viewmodel.dart';
import 'package:agro_info/app/common/widgets/app_text_field.dart';
import 'package:agro_info/app/pages/plague/widgets/filter_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const FilterBottomSheetWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        spacing: 20,
        children: [
          Expanded(
            child: Consumer<PlagueViewmodel>(
              builder: (context, plagueViewmodel, widget) {
                if (plagueViewmodel.searchTerm.isEmpty &&
                    searchController.text.isNotEmpty) {
                  searchController.clear();
                }

                return AppTextField(
                  controller: searchController,
                  onChanged: (value) => plagueViewmodel.searchTerm = value,
                  labelText: "Pesquisar Pragas",
                  prefixIcon: Icon(Icons.search_outlined),
                  hintText: "Pesquisar...",
                );
              },
            ),
          ),
          Consumer<PlagueViewmodel>(
            builder: (context, plagueViewmodel, widget) {
              return Badge(
                isLabelVisible: plagueViewmodel.hasActiveFilters,
                child: IconButton.filledTonal(
                  onPressed: () => _showFilterSheet(context),
                  icon: Icon(Icons.filter_list),
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
