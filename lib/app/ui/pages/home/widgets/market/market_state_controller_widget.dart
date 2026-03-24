import 'package:agro_info/app/common/states/market_state.dart';
import 'package:agro_info/app/common/viewmodels/home_viewmodel.dart';
import 'package:agro_info/app/ui/pages/home/widgets/market/market_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarketStateControllerWidget extends StatelessWidget {
  const MarketStateControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewmodel>(
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
    );
  }
}
