import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class MainApi {
  static String token = "7b96e72c21d470ec45c14aca693d24012e6e3693";
  static final String version = "/api/v1/";

  //static final String base_url = "https://admin-back.sweaka.com";

  static final String base_url = "https://sweaka-backend.herokuapp.com";

  static Future<http.Response?> Get({required String url,}) async {
    try {
      final response =
          await http.get(Uri.parse(base_url + version + url), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: "token " + token,
      });
      return response;
    } catch (e) {
      print('internet is lost from api Get');
      return http.Response("empty " + e.toString(), 500);
    }
  }

  static Future<http.Response> Post(
      {required String url, required Map body, bool no_token = false}) async {
    try {
      final response = await http.post(Uri.parse(base_url + version + url),
          headers: no_token
              ? null
              : {
                  HttpHeaders.contentTypeHeader: 'application/json',
                  HttpHeaders.authorizationHeader: "token " + token,
                },
          body: no_token ? body : jsonEncode(body));
      return response;
    } catch (e) {
      print('internet is lost from api Post');
      return http.Response("empty", 500);
    }
  }

  static Future<http.Response> Patch(
      {required String url, required Map body}) async {
    try {
      final response = await http.patch(Uri.parse(base_url + version + url),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: "token " + token,
          },
          body: jsonEncode(body));
      return response;
    } catch (e) {
      print('internet is lost from api Patch');
      return http.Response.bytes([], 404);
    }
  }

  static Future<http.Response> Put(
      {required String url, required Map body}) async {
    try {
      final response = await http.put(Uri.parse(base_url + version + url),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: "token " + token,
          },
          body: jsonEncode(body));
      return response;
    } catch (e) {
      print('internet is lost from api Put');
      return http.Response.bytes([], 404);
    }
  }
}