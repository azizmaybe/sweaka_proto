import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:intl/intl.dart';

import '../models/uuid.dart';

class Tracker extends Equatable {
  @primaryKey
  String? id;
  DateTime? created_at;
  DateTime? updated_at;
  int? display_id;

  Tracker({
    this.id,
    this.created_at,
    this.updated_at,
    this.display_id
  }) {
    id = id ?? uuid_gen();
    created_at = created_at ?? decode(encode(DateTime.now()));
    updated_at = updated_at ?? decode(encode(DateTime.now()));
    display_id = display_id; 
  }

  static String? encode(DateTime? date) {
    return date == null
        ? null
        : DateFormat('yyyy-MM-ddThh:mm:ss.S').format(date);
  }

  roundTwoNumber(value) {
    return double.parse((value).toStringAsFixed(2));
  }

  static DateTime? decode(String? date) {
    return date == null ? null : DateTime.parse(date);
  }

  void on_update() {
    updated_at = decode(encode(DateTime.now()));
  }


  Map<String, dynamic> toMap() {
    return {
      'mobile_id': id,
      'created_at': encode(created_at),
      'updated_at': encode(updated_at),
      'display_id': display_id,
    };
  }

  @override
  List<Object?> get props => [id];
}
