import 'package:agro_info/app/common/models/market/commodity_data_model.dart';

class GetCommodityDataResponseModel {
  final String name;
  final String interval;
  final String unit;
  final List<CommodityDataModel> data;

  GetCommodityDataResponseModel({
    required this.interval,
    required this.name,
    required this.unit,
    required this.data,
  });

  factory GetCommodityDataResponseModel.fromJson(Map<String, dynamic> json) {
    return GetCommodityDataResponseModel(
      name: json['name'] as String,
      interval: json['interval'] as String,
      unit: json['unit'] as String,
      data: (json['data'] as List<dynamic>)
          .map((json) => CommodityDataModel.fromJson(json))
          .toList(),
    );
  }
}
