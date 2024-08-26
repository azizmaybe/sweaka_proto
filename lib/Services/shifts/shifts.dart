
import 'dart:convert';


import '../../models/shifts.dart';
import '../APIs/api.dart';

class ShiftsRepository {

  static Future<List<Shifts>> loadShiftsOnline(
      {int page = 1,
      List<Shifts> previous_Shifts = const []}) async {
    String url = "supervisor/shifts/";
    url += "?page=$page";
    

    try {
      final response = await MainApi.Get(url: url);
      var decodedJson = json.decode(response!.body);
      print(decodedJson);
      int orders_count = decodedJson['count'] ?? 0;

if (orders_count == 0) {
  return [];
}

List<Shifts> shifts =
List<Shifts>.from(decodedJson['results'].map((e) =>
    Shifts.fromMap(
      e,
    )));
      return shifts;

    } catch (e) {
      print(e);
      print("error loading Shift");
      return [];
    }
    
  }


  static Future<bool> add(Shifts shift) async {
    String url = "supervisor/shifts/";
    try {
      final response = await MainApi.Post(body: shift.toMap(), url: url);
      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print("error adding shift revoking operation");
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

  Future<Shifts?> loadOnlineDriverProfile() async {
    String url = "profile/seller/";
    try {
      final response = await MainApi.Get(url: url);
      bool res = response!.statusCode == 200 || response.statusCode == 201;
      return Shifts.fromJson(response.body);
    } catch (e) {
      print("error loading Seller Profile");
    }
  }

  static Future<Shifts?> updateShift() async {
    String url = "profile/seller/";
    try {
      final response = await MainApi.Get(url: url);
      print("updating seller ");
      return Shifts.fromJson(response!.body);
    } catch (e) {
      print("error updating Seller revoking operation");
    }
  }

  
}
