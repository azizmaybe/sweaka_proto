import 'dart:convert';

import '../../../models/client.dart';
import '../APIs/api.dart';

class Authentication {
  static Future<List> Login({
    required String username,
    required String password,
  }) async {
    String url = "auth/login/";
    Map<String, dynamic> body = {"username": username, "password": password};
    final response = await MainApi.Post(url: url, body: body, no_token: true);
    var decodedJson = json.decode(response.body);
    return decodedJson["profile"] == null
        ? []
        : [decodedJson["token"], Client.fromMap(decodedJson["profile"])];
  }
}
