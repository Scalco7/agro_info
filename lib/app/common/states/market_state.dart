import 'package:agro_info/app/common/enums/commodities_enum.dart';
import 'package:agro_info/app/common/models/market/get_commodity_data_response_model.dart';

sealed class IMarketState {}

class LoadingMarketState implements IMarketState {}

class LoadedMarketState implements IMarketState {
  final Map<CommoditiesEnum, GetCommodityDataResponseModel> commodities;

  const LoadedMarketState({required this.commodities});
}

class FailureMarketState implements IMarketState {
  final String errorMessage;

  FailureMarketState(this.errorMessage);
}
