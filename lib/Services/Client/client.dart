
import 'dart:convert';

import '../../models/client.dart';
import '../APIs/api.dart';

class ClientRepository {

  static Future<List<Client>> loadClientsOnline(
      {int page = 1,
      List<Client> previous_Clients = const []}) async {
    String url = "supervisor/clients/";
    url += "?page=$page";
    

    try {
      final response = await MainApi.Get(url: url, );
      var decodedJson = json.decode(response!.body);
      print(decodedJson);
      int orders_count = decodedJson['count'] ?? 0;

if (orders_count == 0) {
  return [];
}

List<Client> clients =
List<Client>.from(decodedJson['results'].map((e) =>
    Client.fromMap(
      e,
    )));
      return clients;

    } catch (e) {
      print("error loading Client");
      return [];
    }
    
  }


  static Future<bool> add(Client client) async {
    String url = "supervisor/clients/";
    try {
      final response = await MainApi.Post(body: client.toMap(), url: url);
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print("error adding client revoking operation");
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

  Future<Client?> loadOnlineDriverProfile() async {
    String url = "profile/seller/";
    try {
      final response = await MainApi.Get(url: url, );
      bool res = response!.statusCode == 200 || response.statusCode == 201;
      return Client.fromJson(response.body);
    } catch (e) {
      print("error loading Seller Profile");
    }
  }

  static Future<Client?> updateSeller() async {
    String url = "profile/seller/";
    try {
      final response = await MainApi.Get(url: url, );
      print("updating seller ");
      return Client.fromJson(response!.body);
    } catch (e) {
      print("error updating Seller revoking operation");
    }
  }

  
}