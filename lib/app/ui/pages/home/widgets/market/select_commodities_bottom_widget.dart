import 'package:agro_info/app/common/enums/commodities_enum.dart';
import 'package:agro_info/app/common/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectCommoditiesBottomWidget extends StatelessWidget {
  const SelectCommoditiesBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text("Mercados Selecionados", style: theme.textTheme.titleMedium),
          const SizedBox(height: 16),

          Consumer<HomeViewmodel>(
            builder: (context, homeViewmodel, widget) {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: CommoditiesEnum.values.map((commodity) {
                  final isSelected = homeViewmodel.selectedCommodities.contains(
                    commodity,
                  );
                  return FilterChip(
                    label: Text(commodity.portugueseName),
                    selected: isSelected,
                    onSelected: (val) => homeViewmodel.toogleCommodity(commodity),
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 32),

          Row(
            children: [
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
