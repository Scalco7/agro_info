class WeatherConditionModel {
  final String text;
  final String icon;
  final int code;

  WeatherConditionModel({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) {
    return WeatherConditionModel(
      text: json['text'] as String,
      icon: json['icon'] as String,
      code: json['code'] as int,
    );
  }
}