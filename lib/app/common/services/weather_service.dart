import 'dart:convert';

import 'package:agro_info/app/common/models/weather/weather_forecast_response_model.dart';
import 'package:agro_info/app/common/resources/result.dart';
import 'package:agro_info/app/common/services/api_service.dart';
import 'package:http/http.dart';

abstract class IWeatherService {
  Future<Result<WeatherForecastResponseModel, Exception>> getForecast({int days = 5});
}

class WeatherService implements IWeatherService {
  static final WeatherService _instance = WeatherService._internal();
  static const String _apiUrl = "http://api.weatherapi.com/v1";
  static const String _weatherApiKey = String.fromEnvironment(
    'WEATHER_API_KEY',
    defaultValue: 'default_key',
  );
  final IApiService apiService = ApiService();

  WeatherService._internal();
  factory WeatherService() => _instance;

  @override
  Future<Result<WeatherForecastResponseModel, Exception>> getForecast({int days = 5}) async {
    Uri uri = Uri.parse(
      "$_apiUrl/forecast.json?key=$_weatherApiKey&q=London&days=$days&aqi=no&alerts=no&tp=24",
    );
    try {
      Response response = await apiService.get(uri);
      var decodedData = jsonDecode(response.body.toString());
      if (response.statusCode != 200) {
        throw Exception("Erro ao buscar pragas");
      }
      WeatherForecastResponseModel formattedResponse = WeatherForecastResponseModel.fromJson(decodedData);
      return Success(formattedResponse);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
