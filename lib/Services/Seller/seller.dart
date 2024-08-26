
import 'dart:convert';

import '../../models/seller.dart';
import '../APIs/api.dart';

class SellerRepository {

  static Future<List<Seller>> loadSellersOnline(
      {int page = 1,
      List<Seller> previous_Sellers = const []}) async {
    String url = "supervisor/sellers/";
    url += "?page=$page";
    

    try {
      final response = await MainApi.Get(url: url,);
      var decodedJson = json.decode(response!.body);
      print(decodedJson);
      int orders_count = decodedJson['count'] ?? 0;

if (orders_count == 0) {
  return [];
}

List<Seller> sellers =
List<Seller>.from(decodedJson['results'].map((e) =>
    Seller.fromMap(
      e,
    )));
      return sellers;

    } catch (e) {
      print(e);
      print("error loading Client");
      return [];
    }
    
  }


  static Future<bool> add(Seller seller) async {
    String url = "supervisor/clients/";
    try {
      final response = await MainApi.Post(body: seller.toMap(), url: url);
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print("error adding seller revoking operation");
      return false;
    }
  }

/*
  static Future<bool> patch(Client client, bool isSeller) async {
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

  Future<Seller?> loadOnlineSellersProfile() async {
    String url = "profile/supervisor/";
    try {
      final response = await MainApi.Get(url: url, );
      bool res = response!.statusCode == 200 || response.statusCode == 201;
      return Seller.fromJson(response.body);
    } catch (e) {
      print("error loading Seller Profile");
    }
  }

  static Future<Seller?> updateSeller() async {
    String url = "profile/supervisor/";
    try {
      final response = await MainApi.Get(url: url, );
      print("updating seller ");
      return Seller.fromJson(response!.body);
    } catch (e) {
      print("error updating Seller revoking operation");
    }
  }

  
}