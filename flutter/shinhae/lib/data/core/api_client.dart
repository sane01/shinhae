import 'dart:convert';

import 'package:http/http.dart';
import 'package:shinhae/data/core/api_constants.dart';
import 'package:shinhae/data/core/unauthorized_exception.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic> params}) async {
    print('${ApiConstatns.BASE_URL}/m/$path$params');
    final response = await _client.get(
      Uri.http('${ApiConstatns.BASE_URL}', '/m/$path', getParams(params)),
      headers: {
        'Context-Type': 'application/json',
        'Authorization': 'Bearer ${ApiConstatns.BEARER_TOKEN}',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, {Map<dynamic, dynamic> params}) async {
    var i = Uri.http('${ApiConstatns.BASE_URL}', '/m/$path');
    print('$i $params');
    print(jsonEncode(params));
    final response = await _client.post(
      Uri.http('${ApiConstatns.BASE_URL}', '/m/$path'),
      body: jsonEncode(params),
      headers: {
        'Context-Type': 'application/json',
        'Authorization': 'Bearer ${ApiConstatns.BEARER_TOKEN}',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Map<String, dynamic> getParams(Map<dynamic, dynamic> params) {
    Map<String, dynamic> convertedParams = {};
    if (params?.isNotEmpty ?? false) {
      params.forEach((key, value) {
        convertedParams[key] = value;
      });
    }
    return convertedParams;
  }
}
