import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:floor/floor.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sweaka_supervisor_2/models/client.dart';
import 'package:sweaka_supervisor_2/models/material_detail.dart';
import '../models/tracker.dart';

/*
class Seller extends Person{
  

  bool? confirm_rest;
  bool? confirm_paid;
  int? rest_code;
  int? paid_code;
  num? money;
  num credit;
  num credit_limit;
  Seller():super(id: id, created_at: created_at, updated_at: updated_at){
  }
}
*/
class Seller extends Person{
 
  bool? is_active;
  bool? is_missing_profile;
  String? username;
  String? address;
  String? email;
  String? profile_image;
  bool ?trusted;
  bool? confirm_rest;
  bool? confirm_paid;
  double? credit;
  double? credit_limit;
  String? color;
  double? money;
  int? earliest_possible_order_date;
  List<String>? sectors;
  int? client_count;
  int? product_count;
  int? order_count;
  MaterialDetail? material;

  Seller(
      {String? id,
      DateTime? created_at,
    DateTime? updated_at,
    String? warehouse,
    String first_name = '',
    String last_name = '',
    String? address,
    String? email,
    String? phone,
    String? profile_image,
    bool? trusted,
    String gender  = '',
    num? daily_objective,
    String? city,
    num? progress,
    num? objective,
    DateTime? deadline,
    int? display_id,
    this.is_active,
    this.is_missing_profile,
    this.username,
    this.confirm_rest,
    this.confirm_paid,
    this.credit,
    this.credit_limit,
    this.color,
    this.money,
    this.earliest_possible_order_date,
    this.sectors,
    this.client_count,
    this.product_count,
    this.order_count,
    this.material,})
    : super(
      id: id,
      created_at: created_at,
      updated_at: updated_at,
      display_id: display_id,
      city: city,
      warehouse: warehouse,
      first_name: first_name,
      last_name: last_name,
      address: address,
      phone: phone,
      email: email,
      profile_image: profile_image,
      trusted: trusted,
      gender: gender,
      daily_objective: daily_objective,
      progress: progress,
      objective: objective,
      deadline: deadline);

  static String get getRuntimeType {
    return Seller(first_name: "",
    gender: " ", last_name: "")
        .runtimeType
        .toString();
  }

  // setters and getters
  String get name => "$first_name $last_name";
  


bool? get getis_active => is_active;
set setis_active(value)  {is_active = value;
on_update();}


bool? get getconfirm_rest => confirm_rest;
set setconfirm_rest(value)  {confirm_rest = value;
on_update();}

bool? get getconfirm_paid => confirm_paid;
set setconfirm_paid(value)  {confirm_paid = value;
on_update();}

double? get getcredit => credit;
set setcredit(value)  {credit = value;
on_update();}

   set payedCredit(num value) {
      value = roundTwoNumber(value);
      credit = credit! - value;
      super.on_update();
    }

 set addCredit(double value) {
      value = roundTwoNumber(value);
      if (value < credit_limit!) {
        credit = value;
        super.on_update();
      } else {
        if ((credit! + value) <= credit_limit!) {
          credit = credit! + value;
          super.on_update();
        }
      }
   }

String? get getcolor => color;
set setcolor(value)  {color = value;
on_update();}

double? get getmoney => money ?? 0;
set setmoney(double? value)  {money = value;
on_update();}

num? get getdaily_objective => daily_objective;
set setdaily_objective(value)  {daily_objective = value;
on_update();}

num? get getprogress => progress;
set setprogress(value)  {progress = value;
on_update();}

num? get getobjective => objective;
set setobjective(value)  {objective = value;
on_update();}

DateTime? get getdeadline => deadline;
set setdeadline(value)  {deadline = value;
on_update();}

int? get getearliest_possible_order_date => earliest_possible_order_date;
set setearliest_possible_order_date(value)  {earliest_possible_order_date = value;
on_update();}

String? get getcity => city;
set setcity(value)  {city = value;
on_update();}

List<String>? get getsectors => sectors;
set setsectors(value)  {sectors = value;
on_update();}

int? get getclient_count => client_count;
set setclient_count(value) {client_count = value;
on_update();}

int? get getproduct_count => product_count;
set setproduct_count(value) {product_count = value;
on_update();}
int? get getorder_count => order_count;
set setorder_count(value)  {order_count = value;
on_update();}

  void on_update() {
    print("Updating current Seller ");
    super.on_update();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();
    map.addAll({
       "id": super.id,
       'created_at': Tracker.encode(super.created_at!),
      'updated_at': Tracker.encode(super.updated_at!),
      "warehouse": super.warehouse,
      "first_name": super.first_name,
      "last_name": super.last_name,
      "address": super.address,
      "phone": super.phone,
      "email": super.email,
      "profile_image": super.profile_image,
      "trusted": super.trusted,
      "gender": super.gender,
      "daily_objective": super.daily_objective,
      "city": super.city,
      "progress": super.progress,
      "objective": super.objective,
      "deadline": super.deadline,  
      
      "display_id": super.display_id,
      "is_active": is_active,
      "is_missing_profile": is_missing_profile,
      "username": username,  
      "confirm_rest": confirm_rest,
      "confirm_paid": confirm_paid,
      "credit": credit,
      "credit_limit": credit_limit,
      "color": color,
      "money": money, 
      "earliest_possible_order_date": earliest_possible_order_date,   
      "sectors": sectors,
      "client_count": client_count,
      "product_count": product_count,
      "order_count": order_count,
      "material": material?.toMap(),
      });
       map.removeWhere((key, value) => value == null);
    return map;
  }

  factory Seller.fromMap(Map<String, dynamic> map) {
    return Seller(
      id: map['id'],
       created_at: map['created_at'] != String
          ? null
          : Tracker.decode(map['created_at']),
      updated_at: map['updated_at']!= String
          ? null
          : Tracker.decode(map['updated_at']),
      warehouse: map['warehouse'],
      first_name: map['first_name'],
      last_name: map['last_name'],
      address: map['address'],
      phone: map['phone'],
      email: map['email'],
      profile_image: map['profile_image'],
      trusted: map['trusted'],
      gender: map['gender'],
      daily_objective: map['daily_objective'],
      city: map['city'],
      progress: map['progress'],
      objective: map['objective'],
      deadline: map['deadline'],
             material: map['material'] != null
           ? MaterialDetail.fromMap(map['material'])
           : null,
      display_id: map['display_id'],
      is_active: map['is_active'],
      is_missing_profile: map['is_missing_profile'],
      username: map['username'],
      confirm_rest: map['confirm_rest'],
      confirm_paid: map['confirm_paid'],
      credit: map['credit'] ?? 0,
      credit_limit: map['credit_limit']?? 0,
      color: map['color'],
      money: map['money'],
      earliest_possible_order_date: map['earliest_possible_order_date'],
      sectors: List<String>.from(map['sectors']),
      client_count: map['client_count'],
      product_count: map['product_count'],
      order_count: map['order_count'],
    );
  }

  String toJson()=> json.encode(toMap());

  factory Seller.fromJson(String source)=> Seller.fromMap(json.decode(source));

  Map<String, dynamic> filtered_map() {
    Map<String, dynamic> map = super.toMap();
    map.addAll({
      "id": super.id,
      'created_at': Tracker.encode(super.created_at!),
      'updated_at': Tracker.encode(super.updated_at!),
      "warehouse": super.warehouse,
      "first_name": super.first_name,
      "last_name": super.last_name,
      "address": super.address,
      "phone": super.phone,
      "email": super.email,
      "profile_image": super.profile_image,
      "trusted": super.trusted,
      "gender": super.gender,
      "daily_objective": super.daily_objective,
      "city": super.city,
      "progress": super.progress,
      "objective": super.objective,
      "deadline": super.deadline, 
      "display_id": super.display_id,
      "material": material,
      "is_active": is_active,
      "is_missing_profile": is_missing_profile,
      "username": username,
      "confirm_rest": confirm_rest,
      "confirm_paid": confirm_paid,
      "credit": credit,
      "credit_limit": credit_limit,
      "color": color,
      "money": money,
      "earliest_possible_order_date": earliest_possible_order_date, 
      "sectors": sectors,
      "client_count": client_count,
      "product_count": product_count,
      "order_count": order_count,
      
    });
    //map.removeWhere((key, value) => value == null);
    return map;
  }


   Seller copyWith({
     int? display_id,
     String? first_name,
     String? last_name,
     String? address,
     String? phone,
     String? email,
     String? city,
     String? profile_image,
    bool? trusted,
     String? gender,
     num? daily_objective,
     num? progress,
     num? objective,
     DateTime? deadline,
     String? warehouse,
    bool? is_active,
    bool? is_missing_profile,
    String? username,
    bool? confirm_rest,
    bool? confirm_paid,
    double? credit,
    double? credit_limit,
    String? color,
    double? money,
    int? earliest_possible_order_date,
    List<String>? sectors,
    int? client_count,
    int? product_count,
    int? order_count,
    MaterialDetail? material,
  }) {
    return Seller(
      display_id: display_id ?? this.display_id,
      first_name: first_name ?? this.first_name,
      last_name:  last_name ?? this.last_name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      city: city ?? this.city,
      profile_image: profile_image ?? this.profile_image,
      trusted: trusted ?? this.trusted,
      gender: gender ?? this.gender, 
      daily_objective: daily_objective ?? this.daily_objective,
      progress: progress ?? this.progress,
      objective: objective ?? this.objective, 
      deadline: deadline ?? this.deadline,
      warehouse: warehouse ?? this.warehouse,
      is_active: is_active ?? this.is_active,
      is_missing_profile: is_missing_profile ?? this.is_missing_profile,
      username: username ?? this.username,
      confirm_rest: confirm_rest ?? this.confirm_rest,
      confirm_paid: confirm_paid ?? this.confirm_paid,
      credit: credit ?? this.credit,
      credit_limit: credit_limit ?? this.credit_limit,
      color: color ?? this.color,
      money: money ?? this.money,
      earliest_possible_order_date: earliest_possible_order_date ??this.earliest_possible_order_date,
      sectors: sectors ?? this.sectors,
      client_count: client_count ?? this.client_count,
      product_count: product_count ?? this.product_count,
      order_count: order_count ?? this.order_count,
      material: material ?? this.material,
);
}

  @override
  List<Object> get props {
    return [
        id ?? '',
        is_active?? '',
        is_missing_profile?? '',
        username?? '',
        display_id?? '',
        first_name,
        last_name,
        address?? '',
        phone?? '',
        email?? '',
        profile_image?? '',
        trusted?? '',
        gender,
        confirm_rest?? '',
        confirm_paid?? '',
        credit?? '',
        credit_limit?? '',
        color?? '',
        money?? '',
        daily_objective?? '',
        progress?? '',
        objective?? '',
        deadline?? '',
        earliest_possible_order_date?? '',
        city?? '',
        sectors?? '',
        client_count?? '',
        product_count?? '',
        order_count?? '',
        material ?? '',

      //updated_at ?? "",
      //created_at ?? "",
    ];
  }


}