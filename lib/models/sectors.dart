import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:equatable/equatable.dart';

import 'package:flutter/services.dart';
import 'package:sweaka_supervisor_2/models/client.dart';



import '../models/tracker.dart';

class Sector extends Tracker with EquatableMixin {

    List<City>? cities;
    List<Client>? clients;
    int? display_id;
    String? name;
    bool? is_active;
    
    Sector({
        String? id,
        DateTime? created_at,
        DateTime? updated_at,
        this.cities,
        this.clients,
        this.display_id,
        this.name,
        this.is_active,
    }): super(id: id, created_at: created_at, updated_at: updated_at);

     Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();
    map.addAll({
        "id": id,
        "cities": List<dynamic>.from(cities!.map((x) => x.toJson())),
        "clients": List<dynamic>.from(clients!.map((x) => x.toJson())),
        "display_id": display_id,
        "created_at": Tracker.encode(super.created_at!),
        "updated_at": Tracker.encode(super.updated_at!),
        "name": name,
        "is_active": is_active,
    });
    map.removeWhere((key, value) => value == null);
    return map;
  }

  factory Sector.fromMap(Map<String, dynamic> map) {
    return Sector(
      id: map['id'],
      cities: List<City>.from(map['cities']!.map((x) => City.fromMap(x))),
      clients: List<Client>.from(map['clients']!.map((x) => Client.fromMap(x))),
      display_id: map['display_id'],
      created_at: map['created_at'] != String
          ? null
          : Tracker.decode(map['created_at']),
      updated_at : map['updated_at'] != String
          ? null : Tracker.decode(map['updated_at']),
      name: map['name'],
      is_active: map['is_active'],
 
    );
  }
  String toJson() => json.encode(toMap());

  factory Sector.fromJson(String source) => Sector.fromMap(json.decode(source));
  
  
  Map<String, dynamic> filtered_map() {
    Map<String, dynamic> map = super.toMap();
    map.addAll({
     "id": id,
        "cities": List<dynamic>.from(cities!.map((x) => x.toJson())),
        "clients": List<dynamic>.from(clients!.map((x) => x.toJson())),
        "display_id": display_id,
        "created_at": Tracker.encode(super.created_at!),
        "updated_at": Tracker.encode(super.updated_at!),
        "name": name,
        "is_active": is_active,
    });
    //map.removeWhere((key, value) => value == null);
    return map;
  }

    Sector copyWith({
        List<City>? cities,
        List<Client>? clients,
        int ?display_id,
        String? name,
        bool? is_active,
    }) => 
        Sector(
            cities: cities ?? this.cities,
            clients: clients ?? this.clients,
            display_id: display_id ?? this.display_id,
            name: name ?? this.name,
            is_active: is_active ?? this.is_active,
        );

   // Getters and Setters for Sector Class

  List<City>? get getcities => cities;

  set setcities(List<City>? cities) {
    this.cities = cities;
  }

  List<Client>? get getclients => clients;

  set setclients(List<Client>? clients) {
    this.clients = clients;
  }

  int? get getdisplay_id => display_id;

  set setdisplay_id(int? display_id) {
    this.display_id = display_id;
  }

  String? get getname => name;

  set setname(String? name) {
    this.name = name;
  }

  bool? get getis_active => is_active;

  set setis_active(bool? is_active) {
    this.is_active = is_active;
  }

}

class City extends Tracker with EquatableMixin{
    int? seller_count;
    int? client_count;
    int? display_id;
    bool? is_public;
    String? name;
    String? code;
    bool? state;
    
    City({
         String? id,
         DateTime? created_at,
         DateTime? updated_at,
         this.seller_count,
         this.client_count,
         this.display_id,        
         this.is_public,
         this.name,
         this.code,
         this.state,
    });

    Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();
    map.addAll({
       "id": id,
        "seller_count": seller_count,
        "client_count": client_count,
        "display_id": display_id,
        "created_at": created_at,
        "updated_at": updated_at,
        "is_public": is_public,
        "name": name,
        "code": code,
        "state": state,
    });
    map.removeWhere((key, value) => value == null);
    return map;
  }

   factory City.fromMap(Map<String, dynamic> map) {
    return City(
     id: map["id"],
        seller_count: map["seller_count"],
        client_count: map["client_count"],
        display_id: map["display_id"],
        created_at: DateTime.parse(map["created_at"]),
        updated_at: DateTime.parse(map["updated_at"]),
        is_public: map["is_public"],
        name: map["name"],
        code: map["code"],
        state: map["state"],
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromMap(json.decode(source));

  Map<String, dynamic> filtered_map() {
    Map<String, dynamic> map = super.toMap();
    map.addAll({
      "id": id,
        "seller_count": seller_count,
        "client_count": client_count,
        "display_id": display_id,
        "created_at": created_at,
        "updated_at": updated_at,
        "is_public": is_public,
        "name": name,
        "code": code,
        "state": state,
    });
    //map.removeWhere((key, value) => value == null);
    return map;
  }

    City copyWith({
        String? id,
        int? seller_count,
        int? client_count,
        int? display_id,
        DateTime ?created_at,
        DateTime ?updated_at,
        bool? is_public,
        String? name,
        String? code,
        bool? state,
    }) {
      return City(
            id: id ?? this.id,
            seller_count: seller_count ?? this.seller_count,
            client_count: client_count ?? this.client_count,
            display_id: display_id ?? this.display_id,
            created_at: created_at ?? this.created_at,
            updated_at: updated_at ?? this.updated_at,
            is_public: is_public ?? this.is_public,
            name: name ?? this.name,
            code: code ?? this.code,
            state: state ?? this.state,
        );
    }

       // Getters and Setters for City Class

     int? get getseller_count => seller_count;

  set setseller_count(int? value) {
    seller_count = value;
  }

  int? get getclient_count => client_count;

  set setclient_count(int? value) {
    client_count = value;
  }

  int? get getdisplay_id => display_id;

  set setdisplay_id(int? value) {
    display_id = value;
  }

  bool? get getis_public => is_public;

  set setis_public(bool? value) {
    is_public = value;
  }

  String? get getname => name;

  set setname(String? value) {
    name = value;
  }

  String? get getcode => code;

  set setcode(String? value) {
    code = value;
  }

  bool? get getstate => state;

  set setstate(bool? value) {
    state = value;
  }
}

//  // Class Client
// class Client extends Tracker with EquatableMixin {
//     String? is_visited;
//     bool? has_orders;
//     double? credit_limit = 0;
//     double? credit = 0;
//     String? mobile_id;
//     int? display_id;
//     String? first_name;
//     String? last_name;
//     String? adress;
//     String? phone;
//     String? email;
//     String? profile_image;
//     bool? trusted;
//     String? gender;
//     bool? confirm_rest;
//     bool? confirm_paid;
//     int? rest_code;
//     int? paid_code;
//     String? color;
//     double? money;
//     double? daily_objective;
//     String? location;
//     String? doc_n_registre;
//     String? n_registre;
//     String? doc_n_fiscal;
//     String? n_fiscal;
//     String? doc_n_nni;
//     String? n_nni ;
//     DateTime? verified_at;
//     String? city;
//     String? category;
//     String? verified_by;
//     List<String>? stores;


//     Client({
//         String? id,
//       DateTime? updated_at,
//       DateTime? created_at,
//          this.is_visited,
//          this.has_orders,
//          this.credit_limit,
//          this.credit,
//          this.mobile_id,
//          this.display_id,
//          this.first_name,
//          this.last_name,
//          this.adress,
//          this.phone,
//          this.email,
//          this.profile_image,
//          this.trusted,
//          this.gender,
//          this.confirm_rest,
//          this.confirm_paid,
//          this.rest_code,
//          this.paid_code,
//          this.color,
//          this.money,
//          this.daily_objective,
//          this.location,
//          this.doc_n_registre,
//          this.n_registre,
//          this.doc_n_fiscal,
//          this.n_fiscal,
//          this.doc_n_nni,
//          this.n_nni,
//          this.verified_at,
//          this.city,
//          this.category,
//          this.verified_by,
//          this.stores,
//     }): super(id: id, created_at: created_at, updated_at: updated_at);
//     Map<String, dynamic> toMap() {
//     Map<String, dynamic> map = super.toMap();
//     map.addAll({
//       "id": id,
//         "is_visited": is_visited,
//         "has_orders": has_orders,
//         "credit_limit": credit_limit,
//         "credit": credit,
//         "mobile_id": mobile_id,
//         "display_id": display_id,
//         "created_at": created_at,
//         "updated_at": updated_at,
//         "first_name": first_name,
//         "last_name": last_name,
//         "adress": adress,
//         "phone": phone,
//         "email": email,
//         "profile_image": profile_image,
//         "trusted": trusted,
//         "gender": gender,
//         "confirm_rest": confirm_rest,
//         "confirm_paid": confirm_paid,
//         "rest_code": rest_code,
//         "paid_code": paid_code,
//         "color": color,
//         "money": money,
//         "daily_objective": daily_objective,
//         "location": location,
//         "doc_n_registre": doc_n_registre,
//         "n_registre": n_registre,
//         "doc_n_fiscal": doc_n_fiscal,
//         "n_fiscal": n_fiscal,
//         "doc_n_nni": doc_n_nni,
//         "n_nni": n_nni,
//         "verified_at": verified_at,
//         "city": city,
//         "category": category,
//         "verified_by": verified_by,
//         "stores": List<dynamic>.from(stores!.map((x) => x)),
//     });
//     map.removeWhere((key, value) => value == null);
//     return map;
//   }

//   factory Client.fromMap(Map<String, dynamic> map) {
//     return Client(
//       id: map["id"],
//         is_visited: map["is_visited"],
//         has_orders: map["has_orders"],
//         credit_limit: map["credit_limit"],
//         credit: map["credit"],
//         mobile_id: map["mobile_id"],
//         display_id: map["display_id"],
//         created_at: map['created_at'] != String
//           ? null
//           : Tracker.decode(map['created_at']),
//         updated_at: map['updated_at'] != String
//           ? null
//           : Tracker.decode(map['updated_at']),
//         first_name: map["first_name"],
//         last_name: map["last_name"],
//         adress: map["adress"],
//         phone: map["phone"],
//         email: map["email"],
//         profile_image: map["profile_image"],
//         trusted: map["trusted"],
//         gender: map["gender"],
//         confirm_rest: map["confirm_rest"],
//         confirm_paid: map["confirm_paid"],
//         rest_code: map["rest_code"],
//         paid_code: map["paid_code"],
//         color: map["color"],
//         money: map["money"],
//         daily_objective: map["daily_objective"],
//         location: map["location"],
//         doc_n_registre: map["doc_n_registre"],
//         n_registre: map["n_registre"],
//         doc_n_fiscal: map["doc_n_fiscal"],
//         n_fiscal: map["n_fiscal"],
//         doc_n_nni:map["doc_n_nni"],
//         n_nni: map["n_nni"],
//         verified_at: map['verified_at'] != String
//           ? null
//           : Tracker.decode(map['verified_at']),
//         city: map["city"],
//         category: map["category"],
//         verified_by: map["verified_by"],
//         stores: List<String>.from(map["stores"].map((x) => x)),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Client.fromJson(String source) => Client.fromMap(json.decode(source));

//   Map<String, dynamic> filtered_map() {
//     Map<String, dynamic> map = super.toMap();
//     map.addAll({
//       "id": id,
//         "is_visited": is_visited,
//         "has_orders": has_orders,
//         "credit_limit": credit_limit,
//         "credit": credit,
//         "mobile_id": mobile_id,
//         "display_id": display_id,
//         "created_at": created_at,
//         "updated_at": updated_at,
//         "first_name": first_name,
//         "last_name": last_name,
//         "adress": adress,
//         "phone": phone,
//         "email": email,
//         "profile_image": profile_image,
//         "trusted": trusted,
//         "gender": gender,
//         "confirm_rest": confirm_rest,
//         "confirm_paid": confirm_paid,
//         "rest_code": rest_code,
//         "paid_code": paid_code,
//         "color": color,
//         "money": money,
//         "daily_objective": daily_objective,
//         "location": location,
//         "doc_n_registre": doc_n_registre,
//         "n_registre": n_registre,
//         "doc_n_fiscal": doc_n_fiscal,
//         "n_fiscal": n_fiscal,
//         "doc_n_nni": doc_n_nni,
//         "n_nni": n_nni,
//         "verified_at": verified_at,
//         "city": city,
//         "category": category,
//         "verified_by": verified_by,
//         "stores": List<dynamic>.from(stores!.map((x) => x)),
//     });
//     //map.removeWhere((key, value) => value == null);
//     return map;
//   }

// Client copyWith({
//     String? id,
//     String? is_visited,
//     bool? has_orders,
//     double? credit_limit,
//     double? credit,
//     String? mobile_id,
//     int? display_id ,
//     DateTime? created_at,
//     DateTime? updated_at,
//     String? first_name,
//     String? last_name,
//     String? adress,
//     String? phone,
//     String? email,
//     String? profile_image,
//     bool? trusted,
//     String? gender,
//     bool? confirm_rest,
//     bool? confirm_paid,
//     int? rest_code,
//     int? paid_code,
//     String? color,
//     double? money,
//     double? daily_objective,
//     String? location,
//     String? doc_n_registre,
//     String? n_registre,
//     String? doc_n_fiscal,
//     String? n_fiscal,
//     String? doc_n_nni,
//     String? n_nni,
//     DateTime? verified_at,
//     String? city,
//     String? category,
//     String? verified_by,
//     List<String>? stores,
//     }) {
//       return Client(
//             id: id ?? this.id,
//             is_visited: is_visited ?? this.is_visited,
//             has_orders: has_orders ?? this.has_orders,
//             credit_limit: credit_limit ?? this.credit_limit,
//             credit: credit ?? this.credit,
//             mobile_id: mobile_id ?? this.mobile_id,
//             display_id: display_id ?? this.display_id,
//             created_at: created_at ?? this.created_at,
//             updated_at: updated_at ?? this.updated_at,
//             first_name: first_name ?? this.first_name,
//             last_name: last_name ?? this.last_name,
//             adress: adress ?? this.adress,
//             phone: phone ?? this.phone,
//             email: email ?? this.email,
//             profile_image: profile_image ?? this.profile_image,
//             trusted: trusted ?? this.trusted,
//             gender: gender ?? this.gender,
//             confirm_rest: confirm_rest ?? this.confirm_rest,
//             confirm_paid: confirm_paid ?? this.confirm_paid,
//             rest_code: rest_code ?? this.rest_code,
//             paid_code: paid_code ?? this.paid_code,
//             color: color ?? this.color,
//             money: money ?? this.money,
//             daily_objective: daily_objective ?? this.daily_objective,
//             location: location ?? this.location,
//             doc_n_registre: doc_n_registre ?? this.doc_n_registre,
//             n_registre: n_registre ?? this.n_registre,
//             doc_n_fiscal: doc_n_fiscal ?? this.doc_n_fiscal,
//             n_fiscal: n_fiscal ?? this.n_fiscal,
//             doc_n_nni: doc_n_nni ?? this.doc_n_nni,
//             n_nni: n_nni ?? this.n_nni,
//             verified_at: verified_at ?? this.verified_at,
//             city: city ?? this.city,
//             category: category ?? this.category,
//             verified_by: verified_by ?? this.verified_by,
//             stores: stores ?? this.stores,
//         );}

//        // Getters and Setters for Client Class


//      String? getis_visited() {
//     return is_visited;
//   }

//   void setis_visited(String? is_visited) {
//     this.is_visited = is_visited;
//   }

//   bool? gethas_orders() {
//     return has_orders;
//   }

//   void sethas_orders(bool? has_orders) {
//     this.has_orders = has_orders;
//   }

//   double? getcredit_limit() {
//     return credit_limit;
//   }

//   void setcredit_limit(double? credit_limit) {
//     this.credit_limit = credit_limit;
//   }

//   double? getcredit() {
//     return credit;
//   }

//   void setcredit(double? credit) {
//     this.credit = credit;
//   }

//   String? getmobile_id() {
//     return mobile_id;
//   }

//   void setmobile_id(String? mobile_id) {
//     this.mobile_id = mobile_id;
//   }

//   int? getdisplay_id() {
//     return display_id;
//   }

//   void setdisplay_id(int? display_id) {
//     this.display_id = display_id;
//   }

//   String? getfirst_name() {
//     return first_name;
//   }

//   void setfirst_name(String? first_name) {
//     this.first_name = first_name;
//   }

//   String? getlast_name() {
//     return last_name;
//   }

//   void setlast_name(String? last_name) {
//     this.last_name = last_name;
//   }

//   String? getadress() {
//     return adress;
//   }

//   void setadress(String? adress) {
//     this.adress = adress;
//   }

//   String? getphone() {
//     return phone;
//   }

//   void setphone(String? phone) {
//     this.phone = phone;
//   }

//   String? getemail() {
//     return email;
//   }

//   void setemail(String? email) {
//     this.email = email;
//   }

//   String? getprofile_image() {
//     return profile_image;
//   }

//   void setprofile_image(String? profile_image) {
//     this.profile_image = profile_image;
//   }

//   bool? gettrusted() {
//     return trusted;
//   }

//   void settrusted(bool? trusted) {
//     this.trusted = trusted;
//   }

//   String? getgender() {
//     return gender;
//   }

//   void setgender(String? gender) {
//     this.gender = gender;
//   }

//   bool? getconfirm_rest() {
//     return confirm_rest;
//   }

//   void setconfirm_rest(bool? confirm_rest) {
//     this.confirm_rest = confirm_rest;
//   }

//   bool? getconfirm_paid() {
//     return confirm_paid;
//   }

//   void setconfirm_paid(bool? confirm_paid) {
//     this.confirm_paid = confirm_paid;
//   }

//   int? getrest_code() {
//     return rest_code;
//   }
  
// int? get getpaid_code => paid_code;

// set setpaid_code(int? value) {
//   paid_code = value;
// }

// String? get getcolor => color;

// set setcolor(String? value) {
//   color = value;
// }

// double? get getmoney => money;

// set setmoney(double? value) {
//   money = value;
// }

// double? get getdaily_objective => daily_objective;

// set setdaily_objective(double? value) {
//   daily_objective = value;
// }

// String? get getlocation => location;

// set setlocation(String? value) {
//   location = value;
// }

// String? get getdoc_n_registre => doc_n_registre;

// set setdoc_n_registre(String? value) {
//   doc_n_registre = value;
// }

// String? get getn_registre => n_registre;

// set setn_registre(String? value) {
//   n_registre = value;
// }

// String? get getdoc_n_fiscal => doc_n_fiscal;

// set setdoc_n_fiscal(String? value) {
//   doc_n_fiscal = value;
// }

// String? get getn_fiscal => n_fiscal;

// set setn_fiscal(String? value) {
//   n_fiscal = value;
// }

// String? get getdoc_n_nni => doc_n_nni;

// set setdoc_n_nni(String? value) {
//   doc_n_nni = value;
// }

// String? get getn_nni => n_nni;

// set setn_nni(String? value) {
//   n_nni = value;
// }

// DateTime? get getverified_at => verified_at;

// set setverified_at(DateTime? value) {
//   verified_at = value;
// }

// String? get getcity => city;

// set setcity(String? value) {
//   city = value;
// }

// String? get getcategory => category;

// set setcategory(String? value) {
//   category = value;
// }

// String? get getverified_by => verified_by;

// set setverified_by(String? value) {
//   verified_by = value;
// }

// List<String>? get getstores => stores;

// set setstores(List<String>? value) {
//   stores = value;
// }



//     @override
//   List<Object> get props {
//     return [
//         id ?? "",
//         is_visited?? "",
//         has_orders?? "",
//         credit_limit?? "",
//         credit?? "",
//         mobile_id?? "",
//         display_id?? "",
//         created_at?? "",
//         updated_at?? "",
//         first_name?? "",
//         last_name?? "",
//         adress?? "",
//         phone?? "",
//         email?? "",
//         profile_image?? "",
//         trusted?? "",
//         gender?? "",
//         confirm_rest?? "",
//         confirm_paid?? "",
//         rest_code?? "",
//         paid_code?? "",
//         color?? "",
//         money?? "",
//         daily_objective?? "",
//         location?? "",
//         doc_n_registre?? "",
//         n_registre?? "",
//         doc_n_fiscal?? "",
//         n_fiscal?? "",
//         doc_n_nni?? "",
//         n_nni?? "",
//         verified_at?? "",
//         city?? "",
//         category?? "",
//         verified_by?? "",
//         stores?? "",

//       //updated_at ?? "",
//       //created_at ?? "",
//     ];
//   }
// }
