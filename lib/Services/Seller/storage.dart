
import 'dart:convert';

import '../../models/storage.dart';
import '../APIs/api.dart';

class SectorRepository {

  static Future<List<Storage>> loadSectoronline(
      {int page = 1,
      List<Storage> previous_Storage = const []}) async {
    String url = "supervisor/sellers/storages";
    url += "?page=$page";
    

    try {
      final response = await MainApi.Get(url: url);
      var decodedJson = json.decode(response!.body);
      print(decodedJson);
      int orders_count = decodedJson['count'] ?? 0;

if (orders_count == 0) {
  return [];
}

List<Storage> storages =
List<Storage>.from(decodedJson['results'].map((e) =>
    Storage.fromMap(
      e,
    )));
      return storages;

    } catch (e) {
      print(e);
      print("error loading Storage");
      return [];
    }
    
  }


  static Future<bool> add(Storage storage) async {
    String url = "supervisor/Sector/";
    try {
      final response = await MainApi.Post(body: storage.toMap(), url: url);
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

  Future<Storage?> loadOnlineSectorProfile() async {
    String url = "profile/seller/storage";
    try {
      final response = await MainApi.Get(url: url);
      bool res = response!.statusCode == 200 || response.statusCode == 201;
      return Storage.fromJson(response.body as Map<String, dynamic>);
    } catch (e) {
      print("error loading Seller Profile");
    }
  }

  static Future<Storage?> updateSeller() async {
    String url = "profile/seller/storage";
    try {
      final response = await MainApi.Get(url: url);
      print("updating seller ");
      return Storage.fromJson(response!.body as Map<String, dynamic>);
    } catch (e) {
      print("error updating Storage revoking operation");
    }
  }

  
}