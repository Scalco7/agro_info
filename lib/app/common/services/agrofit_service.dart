import 'dart:convert';

import 'package:agro_info/app/common/models/plague.dart';
import 'package:agro_info/app/common/services/api_service.dart';
import 'package:http/http.dart';

abstract class IAgroFitService {
  Future<List<Plague>> getPlagues();
}

class AgroFitService implements IAgroFitService {
  String get _apiUrl => "https://api.cnptia.embrapa.br/agrofit/v1";
  IApiService apiService = ApiService();

  @override
  Future<List<Plague>> getPlagues() async {
    Uri uri = Uri.parse("$_apiUrl/pragas");
    try {
      Response response = await apiService.get(uri);
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
