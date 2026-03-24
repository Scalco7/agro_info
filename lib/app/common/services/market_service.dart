import 'dart:convert';

import 'package:agro_info/app/common/enums/commodities_enum.dart';
import 'package:agro_info/app/common/models/market/get_commodity_data_response_model.dart';
import 'package:agro_info/app/common/resources/result.dart';
import 'package:agro_info/app/common/services/api_service.dart';
import 'package:http/http.dart';

sealed class IMarketservice {}

class MarketService {
  static final MarketService _instance = MarketService._internal();
  final String _apiUrl = "https://www.alphavantage.co";
  static const String _marketApiKey = String.fromEnvironment(
    'MARKET_API_KEY',
    defaultValue: 'default_key',
  );
  final IApiService apiService = ApiService();

  MarketService._internal();
  factory MarketService() => _instance;

  Future<Result<GetCommodityDataResponseModel, Exception>> getCommodityData(
    CommoditiesEnum commodity,
  ) async {
    Uri uri = Uri.parse(
      "$_apiUrl/function=${commodity.apiCode}&interval=monthly&apikey=$_marketApiKey",
    );
    try {
      Response response = await apiService.get(uri);
      var decodedData = jsonDecode(response.body.toString());
      if (response.statusCode != 200) {
        throw Exception("Erro ao buscar preço da commodity");
      }

      GetCommodityDataResponseModel formattedResponse =
          GetCommodityDataResponseModel.fromJson(decodedData);
      return Success(formattedResponse);
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
