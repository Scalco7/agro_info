import 'dart:convert';

import 'package:agro_info/app/common/enums/api_key_type.dart';
import 'package:agro_info/app/common/enums/state_enum.dart';
import 'package:agro_info/app/common/models/agritec_crop.dart';
import 'package:agro_info/app/common/models/city.dart';
import 'package:agro_info/app/common/models/zonig_result.dart';
import 'package:agro_info/app/common/services/api_service.dart';
import 'package:http/http.dart';

abstract class IAgriTecService {
  Future<List<City>> getCities(StateEnum state);
  Future<List<AgritecCrop>> getCropies();
  Future<ZoningResult> getPlantingDateByFailingRisk({
    required int cropId,
    required int ibgeCode,
    required String risk,
  });
}

class AgriTecService implements IAgriTecService {
  static final AgriTecService _instance = AgriTecService._internal();
  String get _apiUrl => "https://api.cnptia.embrapa.br/agritec/v2";
  final IApiService apiService = ApiService();

  AgriTecService._internal();
  factory AgriTecService() => _instance;

  @override
  Future<ZoningResult> getPlantingDateByFailingRisk({
    required int cropId,
    required int ibgeCode,
    required String risk,
  }) async {
    Uri uri = Uri.parse(
      "$_apiUrl/zoneamento?idCultura=$cropId&codigoIBGE=$ibgeCode&risco=${risk.toLowerCase()}",
    );
    try {
      Response response = await apiService.get(
        uri,
        apiKeyType: ApiKeyType.embrapa,
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode != 200) {
        throw Exception("Erro ao calcular as datas de plantio");
      }
      ZoningResult zoningResponse = ZoningResult.fromJson(data["data"][0]);
      return zoningResponse;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<City>> getCities(StateEnum state) async {
    Uri uri = Uri.parse(
      "$_apiUrl/municipios?uf=${state.acronym}&dataAtualizacao=2018-01-01",
    );
    try {
      Response response = await apiService.get(
        uri,
        apiKeyType: ApiKeyType.embrapa,
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode != 200) {
        throw Exception("Erro ao buscar municipios");
      }
      List<City> cities = [];

      for (Map<String, dynamic> index in data["data"]) {
        cities.add(City.fromJson(index));
      }
      return cities;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AgritecCrop>> getCropies() async {
    Uri uri = Uri.parse("$_apiUrl/culturas");
    try {
      Response response = await apiService.get(
        uri,
        apiKeyType: ApiKeyType.embrapa,
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode != 200) {
        throw Exception("Erro ao buscar culturas");
      }
      List<AgritecCrop> cropies = [];

      for (Map<String, dynamic> index in data["data"]) {
        cropies.add(AgritecCrop.fromJson(index));
      }
      return cropies;
    } catch (e) {
      rethrow;
    }
  }
}
