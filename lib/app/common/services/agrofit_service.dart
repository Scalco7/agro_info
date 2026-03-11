import 'dart:convert';

import 'package:agro_info/app/common/enums/api_key_type.dart';
import 'package:agro_info/app/common/models/plague.dart';
import 'package:agro_info/app/common/services/api_service.dart';
import 'package:http/http.dart';

abstract class IAgroFitService {
  Future<List<Plague>> getPlagues();
}

class AgroFitService implements IAgroFitService {
  static final AgroFitService _instance = AgroFitService._internal();
  String get _apiUrl => "https://api.cnptia.embrapa.br/agrofit/v1";
  final IApiService apiService = ApiService();

  AgroFitService._internal();
  factory AgroFitService() => _instance;

  @override
  Future<List<Plague>> getPlagues() async {
    Uri uri = Uri.parse("$_apiUrl/pragas");
    try {
      Response response = await apiService.get(
        uri,
        apiKeyType: ApiKeyType.embrapa,
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode != 200) {
        throw Exception("Erro ao buscar pragas");
      }
      List<Plague> plagues = [];

      for (Map<String, dynamic> index in data) {
        plagues.add(Plague.fromJson(index));
      }
      return plagues;
    } catch (e) {
      rethrow;
    }
  }
}
