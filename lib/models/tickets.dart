import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../constants/sweakaColors.dart';
import '../models/tracker.dart';





class Ticket extends Tracker {


  Ticket({
    String? id,
    DateTime? created_at,
    DateTime? updated_at,
    int? display_id,



  }) : super(created_at: created_at, id: id, updated_at: updated_at, display_id: display_id) ;

  /**
   * post_request : this param is only for lost and damage transactions
   * Damage and lost transaction should be validated by manager or storekeeper
   */
  Map<String, dynamic> toMap({bool post_request = false}) {
    Map<String, dynamic> map = super.toMap();
    map.addAll({
 
    });
    /*   if (is_Ticket ?? false) {
      map.remove('transaction');
    } */
    map.removeWhere((key, value) => value == null);
    return map;
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(

      id: map['id'],

      display_id: map['display_id'],
      created_at: Tracker.decode(map['created_at']),
      
      updated_at: Tracker.decode(map['updated_at']),
    );
  }

 

  Ticket copyWith({
    int? display_id,
   
  }) {
    return Ticket(
      id: id ?? this.id,
      
      display_id: display_id ?? this.display_id,
     
    );
  }

  @override
  List<Object> get props {
    return [
      display_id ?? "",
      
      id ?? "",
      updated_at ?? "",
      created_at ?? "",
    ];
  }
}
