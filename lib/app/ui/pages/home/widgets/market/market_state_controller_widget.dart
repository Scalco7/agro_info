import 'package:agro_info/app/common/states/market_state.dart';
import 'package:agro_info/app/common/viewmodels/home_viewmodel.dart';
import 'package:agro_info/app/ui/pages/home/widgets/market/market_widget.dart';
import 'package:agro_info/app/ui/pages/home/widgets/market/select_commodities_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketStateControllerWidget extends StatelessWidget {
  const MarketStateControllerWidget({super.key});

  void _showCommoditiesModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const SelectCommoditiesBottomWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      constraints: BoxConstraints(
        minHeight: 200
      ),
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(color: colorScheme.tertiaryFixed, width: 4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mercado",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              IconButton(
                iconSize: 20,
                color: colorScheme.onTertiaryContainer,
                icon: Icon(Icons.settings_outlined),
                onPressed: () => _showCommoditiesModal(context),
              ),
            ],
          ),
          Consumer<HomeViewmodel>(
            builder: (context, homeViewmodel, widget) {
              IMarketState state = homeViewmodel.marketState;

              switch (state) {
                case LoadingMarketState():
                  return Center(child: const CircularProgressIndicator());
                case FailureMarketState():
                  return Center(child: Text(state.errorMessage));
                case LoadedMarketState():
                  return MarketWidget(commodities: state.commodities);
              }
            },
          ),
        ],
      ),
    );
  }
}
