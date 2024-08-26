import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../models/tracker.dart';

class Person extends Tracker with EquatableMixin {
  String? warehouse;
  String first_name;
  String last_name;
  String? address;
  String? phone;
  String? email;
  String? profile_image;
  bool? trusted;
  String gender;
  num? daily_objective;
  String? city;
  num? progress;
  num? objective;
  DateTime? deadline;
  Person(
      {String? id,
      DateTime? updated_at,
      DateTime? created_at,
      int? display_id,
      this.warehouse,
      this.address,
      this.email,
      this.phone,
      this.city,
      this.daily_objective,
      this.deadline,
      required this.first_name,
      required this.gender,
      required this.last_name,
      this.objective,
      this.profile_image,
      this.progress,
      this.trusted})
      : super(created_at: created_at, id: id, updated_at: updated_at, display_id: display_id) ;

   static String get getRuntimeType {
     return Person(first_name: "", gender: " ", last_name: "")
         .runtimeType
         .toString();
   }

   // setters and getters
   String get getname => first_name + " " + last_name;

   String? get getwarehouse => warehouse;

   int? get getdisplay_id => display_id;

   String? get getcity => city;

   DateTime? get getdeadline => deadline;

   String? get getgender => gender;

   String? get getprofile_image => profile_image;

   bool? get gettrusted => trusted;
  
   String get getfirst_name => first_name;

    String get getlast_name => last_name;

   String? get getaddress => address;

   String? get getemail => email;

   String? get getphone => phone;

   num? get getprogress => progress;

   num? get getobjective => objective;

   num? get getdaily_objective => daily_objective;

  set setwarehouse(value) {
     on_update();
     warehouse = value;
   }

   set setdispaly_id(value) {
     on_update();
     display_id = value;
   }

   set setcity(value) {
     on_update();
     city = value;
   }

   set setdeadline(value) {
     on_update();
     deadline = value;
   }

   set setgender(value) {
     on_update();
     gender = value;
   }

   set setprofile_image(value) {
     on_update();
     profile_image = value;
   }

   set settrusted(value) {
     on_update();
     trusted = value;
   }


   set setfirst_name(value) {
     on_update();
     first_name = value;
   }
   set setlast_name(value) {
     on_update();
     last_name = value;
   }

   set setaddress(address) {
   on_update();
     this.address = address;
   }

   set setemail(value) {
     on_update();
     email = value;
   }

set setphone(phone) {
     on_update();
     this.phone = phone;
   }
  
   set setprogress(progress) {
     this.progress = progress;
     super.on_update();
   }


 set setobjective(objective) {
     this.objective = objective;
     super.on_update();
   }

   set setdailyobjective(value) {
     daily_objective = value;
     super.on_update();
   }


   void on_update() {
     print("Updating current client ");
     super.on_update();
   }

   Map<String, dynamic> toMap() {
     Map<String, dynamic> map = super.toMap();
     map.addAll({
      'mobile_id': super.id,
      'created_at': Tracker.encode(super.created_at!),
       'updated_at': Tracker.encode(super.updated_at!),
       'warehouse': warehouse,   
       'display_id': display_id,
       'first_name': first_name,
       'last_name': last_name,
       'address': address,
       'phone': phone,
       'email': email,
       'profile_image': profile_image,
       'trusted': trusted,
       'gender': gender[0],
       'daily_objective': daily_objective,
       'progress': progress,
       'objective': objective,
       'deadline': deadline != null ? Tracker.encode(deadline!) : null,
     });
     map.removeWhere((key, value) => value == null);
     return map;
   }

   factory Person.fromMap(Map<String, dynamic> map) {
     return Person(
       warehouse: map['warehouse'],
       id: map['mobile_id'],
       display_id: map['display_id'],
       created_at: map['created_at'] != String
           ? null
           : Tracker.decode(map['created_at']),
       updated_at: map['updated_at'] != String
           ? null
           : Tracker.decode(map['updated_at']),
       first_name: map['first_name'],
       last_name: map['last_name'],
       address: map['address'],
       phone: map['phone'],
       email: map['email'],
       profile_image: map['profile_image'],
       trusted: map['trusted'],
       gender: map['gender'],
       daily_objective: map['daily_objective'],
       progress: map['progress'],
       objective: map['objective'],
       deadline: map['deadline'] != String
           ? null
           : map['deadline'] != null
               ? Tracker.decode(map['deadline'])
               : null,
     );
   }

   String toJson() => json.encode(toMap());

   factory Person.fromJson(String source) => Person.fromMap(json.decode(source));

  /*  static String Location_to_string(LatLng value) {
   return value.latitude.toString() + "_" + value.longitude.toString();
   }

   static LatLng? string_to_Location(String? value) {
     if (value == null) {
       return null;
     }
     List<String> res = value.split('_').toList();
     return LatLng(double.parse(res[0]), double.parse(res[1]));
   }

   static String encode_location(LatLng location) {
     return "SRID=4326;POINT (" +
         location.latitude.toStringAsFixed(8) +
         " " +
         location.longitude.toStringAsFixed(8) +
         ")";
   }

 static LatLng decode_location(String location) {
     if (location.contains('SRID=4326;POINT')) {
       location = location.replaceFirst("SRID=4326;POINT (", "");
       location = location.replaceFirst(")", "");

       var res = location.split(' ').map(double.parse).toList();
       return LatLng(res[0], res[1]);
     } else {
       var res = location.split('-').map(double.parse).toList();
       return LatLng(res[0], res[1]);
     }
   }*/

   Map<String, dynamic> filtered_map() {
     Map<String, dynamic> map = super.toMap();
     map.addAll({
       'mobile_id': super.id,
       'created_at': Tracker.encode(super.created_at!),
       'updated_at': Tracker.encode(super.updated_at!),
       'display_id': display_id,
       'warehouse' : warehouse,
       'first_name': first_name,
       'last_name': last_name,
       'address': address,
       'phone': phone,
       'email': email,
       'trusted': trusted,
       'gender': gender,
       'city' : city,
       'daily_objective': daily_objective,
       'progress': progress,
       'objective': objective,
       'deadline': deadline != null ? Tracker.encode(deadline!) : null,
       'profile_image' : profile_image,
       
     });
     //map.removeWhere((key, value) => value == null);
     return map;
   }

   Person copyWith({
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
   }) {
     return Person(

       display_id: display_id ?? this.display_id,
       first_name: first_name ?? this.first_name,
       last_name: last_name ?? this.last_name,
       address: address ?? this.address,
       phone: phone ?? this.phone,
       email: email ?? this.email,
       city : city ?? this.city,
       profile_image: profile_image ?? this.profile_image,
       trusted: trusted ?? this.trusted,
       gender: gender ?? this.gender,
       daily_objective: daily_objective ?? this.daily_objective,
       progress: progress ?? this.progress,
       objective: objective ?? this.objective,
       deadline: deadline ?? this.deadline,
      warehouse: warehouse ?? this.warehouse,
     );
   }

   @override
   List<Object> get props {
     return [
       id ?? "",
       first_name,
       last_name,
       address ?? "",
       phone ?? "",
       email ?? "",
       profile_image ?? "",
       trusted ?? "",
       gender,
       city ?? '',
       daily_objective ?? "",
       deadline ?? "",
       progress ?? "",
       objective ?? "",
       warehouse ?? "",

       //updated_at ?? "",
       //created_at ?? "",
     ];
   }
}
  // Future<Marker> getMarker({bool selected = false}) async {
  //   final Uint8List markerIcon = await getBytesFromAsset(
  //       "assets/images/" + (selected ? "marker_blue.png" : "mapmarker.png"),
  //       120);

  //   return Marker(
  //     icon: BitmapDescriptor.fromBytes(markerIcon),
  //     markerId: MarkerId("marker" + id!),
  //     position: location!,
  //   );
  // }

  // Future<Uint8List> getBytesFromAsset(String path, int width) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: width);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
  //       .buffer
  //       .asUint8List();
  // }


class Client extends Person{
  String? sector;
  String? doc_n_registre;
  String? n_registre;
  String? doc_n_fiscal;
  String? n_fiscal;
  String? doc_n_nni;
  String? n_nni ;
  String? category;
  String? verified_by;
  List<String>? stores;
  bool? is_visited;
  bool? has_order;
  bool? is_verified;
  LatLng? location;
  DateTime? verified_at;
  String? store_category;

  Client({
    String? id,
    DateTime? created_at,
    DateTime? updated_at,
    String? warehouse,
    String first_name = '',
    String last_name = '',
    String? address,
    String? phone,
    String? email,
    String? profile_image,
    bool? trusted,
    String gender  = '',
    num? daily_objective,
    String? city,
    num? progress,
    num? objective,
    DateTime? deadline,
    int display_id = 0,
    this.is_visited,
    this.sector,
    this.doc_n_registre,
    this.n_registre,
    this.doc_n_fiscal,
    this.n_fiscal,
    this.doc_n_nni,
    this.n_nni ,
    this.category,
    this.verified_by,
    this.stores,
    this.has_order,
    this.is_verified,
    this.location,
    this.verified_at,
    this.store_category,
}): super(
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

      Map<String, dynamic> toMap() {
     Map<String, dynamic> map = super.toMap();
     map.addAll({
       
       'mobile_id': super.id,
       'created_at': Tracker.encode(super.created_at!),
       'updated_at': Tracker.encode(super.updated_at!),
       'warehouse': super.warehouse,
       'first_name': super.first_name,
       'last_name': super.last_name,
       'address': super.address,
       'phone': super.phone,
       'email': super.email,
       'profile_image': super.profile_image,
       'trusted': super.trusted,
       'gender': super.gender[0],
       'daily_objective': super.daily_objective,
       'city': super.city,
       'progress': super.progress,
       'objective': super.objective,
       'deadline': super.deadline != null ? Tracker.encode(deadline!) : null,
       'display_id': super.display_id,
       'is_visited': is_visited,
       'sector': sector,
       'doctor_n_registre': doc_n_registre,
       'n_registre': n_registre,
        'doc_n_fiscal': doc_n_fiscal,
        'n_fiscal': n_fiscal,
        'doc_n_nni': doc_n_nni,
        'n_nni': n_nni,
        'category': category,
        'verified_by': verified_by,
        'stores': stores,
        'has_order': has_order,
        'is_verified': is_verified,
        'location': location,
        'verified_at': verified_at,
        'store_category': store_category,
     });
     map.removeWhere((key, value) => value == null);
     return map;
   }


  
   factory Client.fromMap(Map<String, dynamic> map) {
     return Client(
       
        id: map["id"],
        created_at: map['created_at'] != String
           ? null
           : Tracker.decode(map['created_at']),
        updated_at: map['updated_at'] != String
           ? null
           : Tracker.decode(map['updated_at']),
         warehouse: map["warehouse"],
         first_name: map["first_name"],
         last_name: map["last_name"],
         address: map["address"],
         phone: map["phone"],
         email: map["email"],
         profile_image: map["profile_image"],
         trusted: map["trusted"],
         gender: map["gender"],
         daily_objective: map["daily_objective"],
         city: map["city"],
         progress: map["progress"],
         objective: map["objective"],
         deadline: map["deadline"],
         display_id: map["display_id"],
         is_visited: map["is_visited"],
         sector: map["sector"],
         doc_n_registre: map["doc_n_registre"],
         n_registre: map["n_registre"],
         doc_n_fiscal: map["doc_n_fiscal"],
         n_fiscal: map["n_fiscal"],
         doc_n_nni:map["doc_n_nni"],
         n_nni: map["n_nni"],
         category: map["category"],
         verified_by: map["verified_by"],
         stores: List<String>.from(map["stores"].map((x) => x)),
         has_order: map["has_order"],
         is_verified: map["is_verified"],       
         location: map["location"],
         verified_at: map['verified_at'] != String
           ? null
           : Tracker.decode(map['verified_at']),       
         store_category: map["store_category"],
     );
   }

   

    bool get hasorder => has_order ?? false;
    
    set setLocation(location) {
   this.location = location;
  
      on_update();
    }

    set hasorder(value) {
      has_order = value;
      on_update();
    }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));

   Map<String, dynamic> filtered_map() {
     Map<String, dynamic> map = super.toMap();
     map.addAll({
       'mobile_id': super.id,
       'created_at': Tracker.encode(super.created_at!),
       'updated_at': Tracker.encode(super.updated_at!),
       'warehouse' : super.warehouse,
       'first_name': super.first_name,
       'last_name': super.last_name,
       'address': super.address,
       'phone': super.phone,
       'email': super.email,
       'profile_image': super.profile_image,
       'trusted': super.trusted,
       'gender': super.gender,
       'daily_objective': super.daily_objective,
       'city' : super.city,
       'progress': super.progress,
       'objective': super.objective,
       'deadline': super.deadline != null ? Tracker.encode(deadline!) : null,
       'display_id': super.display_id,
       'is_visited': is_visited,
       'sector': sector,
       'doc_n_registre': doc_n_registre,
       'n_registre': n_registre,
       'doc_n_fiscal': doc_n_fiscal,
       'n_fiscal': n_fiscal,
       'doc_n_nni': doc_n_nni,
       'n_nni': n_nni,
       'category': category,
       'verified_by': verified_by,
       'stores': stores,
       'has_order': has_order,
       'is_verfied': is_verified,
       'location': location,
       'verified_at': verified_at,
       'store_category':store_category,       
     });
      //map.removeWhere((key, value) => value == null);
    return map;
   }
}