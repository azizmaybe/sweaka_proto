
import 'dart:convert';

import '../../models/sectors.dart';
import '../APIs/api.dart';

class SectorRepository {

  static Future<List<Sector>> loadSectoronline(
      {int page = 1,
      List<Sector> previous_Sector = const []}) async {
    String url = "supervisor/sectors/";
    url += "?page=$page";
    

    try {
      final response = await MainApi.Get(url: url, );
      var decodedJson = json.decode(response!.body);
      print(decodedJson);
      int orders_count = decodedJson['count'] ?? 0;

if (orders_count == 0) {
  return [];
}

List<Sector> sectors =
List<Sector>.from(decodedJson['results'].map((e) =>
    Sector.fromMap(
      e,
    )));
      return sectors;

    } catch (e) {
      print(e);
      print("error loading Sector");
      return [];
    }
    
  }


  static Future<bool> add(Sector sector) async {
    String url = "supervisor/Sector/";
    try {
      final response = await MainApi.Post(body: sector.toMap(), url: url);
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print("error adding client revoking operation");
      return false;
    }
  }

/*
  static Future<bool> patch(Sector client, bool isSeller) async {
    String url;
    if (isSeller) {
      url = "profile/seller/" + client.id! + "/";
      return true;
    } else {
      url = "seller/clients" + client.id! + "/";
    }
    try {
      print(client.filtered_map());
      final response = await MainApi.Put(body: client.filtered_map(), url: url);
      bool res = response.statusCode == 200 || response.statusCode == 201;
      if (!res) print(response.body);
      return res;
    } catch (e) {
      print("error patching client");
      print(e.toString());
      return false;
    }
  } */

  Future<Sector?> loadOnlineSectorProfile() async {
    String url = "profile/seller/";
    try {
      final response = await MainApi.Get(url: url, );
      bool res = response!.statusCode == 200 || response.statusCode == 201;
      return Sector.fromJson(response.body);
    } catch (e) {
      print("error loading Seller Profile");
    }
  }

  static Future<Sector?> updateSeller() async {
    String url = "profile/seller/";
    try {
      final response = await MainApi.Get(url: url, );
      print("updating seller ");
      return Sector.fromJson(response!.body);
    } catch (e) {
      print("error updating Seller revoking operation");
    }
  }

  
}
