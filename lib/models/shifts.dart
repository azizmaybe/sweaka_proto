import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../models/tracker.dart';



class Shifts extends Tracker with EquatableMixin{
 
    String? sector_id;
    String? name;
    String? day;
    int? cities_count;
    int? clients_count;   
     Shifts({
      
        DateTime? created_at,
        DateTime? updated_at,
        this.sector_id,
        this.name,
        this.day,
        this.cities_count,
        this.clients_count,
    }) :  super(created_at: created_at, updated_at: updated_at);


  String? get getsector_id => sector_id;
  set setsector_id(String? value) => sector_id = value;

  String? get getname => name;
  set setname(String? value) => name = value;

  String? get getday => day;
  set setday(String? value) => day = value;

  int? get getcities_count => cities_count;
  set setcities_count(int? value) => cities_count = value;

  int? get getclients_count => clients_count;
  set setclients_count(int? value) => clients_count = value;

  DateTime? get getcreated_at => created_at;
  set setcreated_at(DateTime? value) => created_at = value;

  DateTime? get getupdated_at => updated_at;
  set setupdated_at(DateTime? value) => updated_at = value;



   Map<String, dynamic> toMap() {
     Map<String, dynamic> map = super.toMap();
     map.addAll({
 
      'created_at': Tracker.encode(super.created_at!),
       'updated_at': Tracker.encode(super.updated_at!),
       'sector_id': sector_id,
       'name': name,
       'day': day,
       'cities_count': cities_count,
       'clients_count': clients_count,
     });
     map.removeWhere((key, value) => value == null);
     return map;
   }

    factory Shifts.fromMap(Map<String, dynamic> map) {
     return Shifts(
  
       created_at: map['created_at'] != String
           ? null
           : Tracker.decode(map['created_at']),
       updated_at: map['updated_at'] != String
           ? null
           : Tracker.decode(map['updated_at']),
        sector_id: map['sector_id'],
        name: map['name'],
        day: map['day'],
        cities_count: map['cities_count'],
        clients_count: map['clients_count'],
     );
   }

   String toJson() => json.encode(toMap());

   factory Shifts.fromJson(String source) => Shifts.fromMap(json.decode(source));

    Map<String, dynamic> filtered_map() {
     Map<String, dynamic> map = super.toMap();
     map.addAll({
       'created_at': Tracker.encode(super.created_at!),
       'updated_at': Tracker.encode(super.updated_at!),
       'sector_id': sector_id,
       'name': name,
       'day': day,
       'cities_count': cities_count,
       'clients_count': clients_count,
       
     });
     //map.removeWhere((key, value) => value == null);
     return map;
   }

    Shifts copyWith({
        
        String ?sector_id,
        String? name,
        String? day,
        int? cities_count,
        int? clients_count,
        DateTime? created_at,
        DateTime? updated_at,
    }) => 
        Shifts(
            sector_id: sector_id ?? this.sector_id,
            name: name ?? this.name,
            day: day ?? this.day,
            cities_count: cities_count ?? this.cities_count,
            clients_count: clients_count ?? this.clients_count,
            created_at: created_at ?? this.created_at,
            updated_at: updated_at ?? this.updated_at,
        );
        @override
   List<Object> get props {
     return [
       sector_id ?? "",
       name ?? "",
       day ?? "",
       cities_count ?? "",
       clients_count ?? "",
       //updated_at ?? "",
       //created_at ?? "",
     ];
   }
}