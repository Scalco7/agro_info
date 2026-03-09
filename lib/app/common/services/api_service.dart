import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

abstract class IApiService {
  Future<Response> post(Uri uri, {required Map<String, dynamic> jsonBody});
  Future<Response> get(Uri uri);
}

class ApiService implements IApiService {
  @override
  Future<Response> post(
    Uri uri, {
    required Map<String, dynamic> jsonBody,
  }) async {
    try {
      var body = json.encode(jsonBody);

      return http.post(uri, body: body, headers: _getHeaders());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> get(Uri uri) async {
    return http.get(uri, headers: _getHeaders());
  }

  Map<String, String> _getHeaders() {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    return headers;
  }
}
