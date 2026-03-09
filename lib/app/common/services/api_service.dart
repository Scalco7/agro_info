import 'dart:convert';

import 'package:agro_info/app/common/enums/api_key_type.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

abstract class IApiService {
  Future<Response> post(
    Uri uri, {
    required Map<String, dynamic> jsonBody,
    ApiKeyType? apiKeyType,
  });
  Future<Response> get(Uri uri, {ApiKeyType? apiKeyType});
}

class ApiService implements IApiService {
  static const String _embrapaApiKey = String.fromEnvironment(
    'EMBRAPA_API_KEY',
    defaultValue: 'default_key',
  );

  @override
  Future<Response> post(
    Uri uri, {
    required Map<String, dynamic> jsonBody,
    ApiKeyType? apiKeyType,
  }) async {
    try {
      var body = json.encode(jsonBody);

      return http.post(
        uri,
        body: body,
        headers: _getHeaders(apiKeyType: apiKeyType),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> get(Uri uri, {ApiKeyType? apiKeyType}) async {
    return http.get(uri, headers: _getHeaders(apiKeyType: apiKeyType));
  }

  Map<String, String> _getHeaders({ApiKeyType? apiKeyType}) {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    if (apiKeyType != null) {
      headers['Authorization'] = "Bearer ${getApiKey(apiKeyType)}";
    }

    return headers;
  }

  String getApiKey(ApiKeyType apiKeyType) {
    switch (apiKeyType) {
      case ApiKeyType.embrapa:
        return _embrapaApiKey;
    }
  }
}
