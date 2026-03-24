import 'package:agro_info/app/common/enums/commodities_enum.dart';
import 'package:agro_info/app/common/models/market/get_commodity_data_response_model.dart';
import 'package:flutter/material.dart';

class MarketWidget extends StatelessWidget {
  final Map<CommoditiesEnum, GetCommodityDataResponseModel> commodities;
  const MarketWidget({super.key, required this.commodities});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: commodities.keys.map((commodityEnum) {
        return Text(commodityEnum.portugueseName);
      }).toList(),
    );
  }
}
