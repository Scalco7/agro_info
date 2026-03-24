class CommodityDataModel {
   final DateTime date;
  final double value;

  CommodityDataModel({
    required this.date,
    required this.value,
  });

  factory CommodityDataModel.fromJson(Map<String, dynamic> json) {
    return CommodityDataModel(
      date: DateTime.parse(json['date'] as String),
      value: (json['price'] as num).toDouble(),
    );
  }
}
