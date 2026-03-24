import 'package:agro_info/app/common/enums/commodities_enum.dart';
import 'package:agro_info/app/common/models/market/commodity_data_model.dart';

sealed class IMarketState {}

class LoadingMarketState implements IMarketState {}

class LoadedMarketState implements IMarketState {
 final  Map<CommoditiesEnum, CommodityDataModel> commodities;

 const LoadedMarketState({required this.commodities});
}

class FailureMarketState implements IMarketState {}