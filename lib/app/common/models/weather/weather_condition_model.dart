import 'package:agro_info/app/common/enums/weather_condition_enum.dart';

class WeatherConditionModel {
  final String text;
  final String icon;
  final int code;
  final WeatherConditionEnum condition;

  WeatherConditionModel({
    required this.text,
    required this.icon,
    required this.code,
  }) : condition = WeatherConditionEnum.fromCode(code);

  String get iconUrl => icon.startsWith('//') ? "https:$icon" : icon;

  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) {
    return WeatherConditionModel(
      text: json['text'] as String,
      icon: json['icon'] as String,
      code: json['code'] as int,
    );
  }
}
