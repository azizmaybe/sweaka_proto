import 'dart:convert';
import '../APIs/api.dart';

class Authentication {
  static Future<void> logout(String token) async {
    String url = "auth/logout/";
    final response = await MainApi.Get(url: url);
    if (response?.statusCode == 200) {
      print("Logged out successfully");
    } else {
      var decodedJson = json.decode(response!.body);
      print("Logout failed: ${decodedJson["message"]}");
    }
  }
}
