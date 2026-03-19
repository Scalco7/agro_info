import 'package:agro_info/app/common/enums/plague_classification.dart';
import 'package:agro_info/app/common/viewmodels/plague_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBottomSheetWidget extends StatelessWidget {
  const FilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PlagueViewmodel plagueViewmodel = Provider.of<PlagueViewmodel>(
      context,
    );
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text("Filtrar por Tipo", style: theme.textTheme.titleMedium),
          const SizedBox(height: 16),

          Wrap(
            spacing: 8,
            children: PlagueClassification.values.map((type) {
              final isSelected = plagueViewmodel.classificationFilters.contains(type);
              return FilterChip(
                label: Text(type.filterName.toUpperCase()),
                selected: isSelected,
                selectedColor: type == PlagueClassification.doenca
                    ? theme.colorScheme.tertiaryContainer
                    : theme.colorScheme.secondaryContainer,
                onSelected: (val) => plagueViewmodel.toggleFilter(type),
              );
            }).toList(),
          ),

          const SizedBox(height: 32),

          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    plagueViewmodel.clearFilters();
                    Navigator.pop(context);
                  },
                  child: const Text("Limpar"),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Aplicar"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
