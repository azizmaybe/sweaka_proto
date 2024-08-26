import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import '../models/tracker.dart';

class MaterialDetail extends Tracker with EquatableMixin {
  String? id;
  String? material_name;
  String? material_note;
  String? material_registration_number;
  String? model_name;
  String? model_weight;
  String? model_type;
  String? brand_name;
  String? material_status;
  DateTime? material_start_date;
  DateTime? material_end_date;

  MaterialDetail({
    String? id,
    this.material_name,
    this.material_note,
    this.material_registration_number,
    this.model_name,
    this.model_weight,
    this.model_type,
    this.brand_name,
    this.material_status, // == 11 then available else =/=  11 is not available
    this.material_start_date,
    this.material_end_date,
  }) : super(id: id);

  factory MaterialDetail.fromMap(Map<String, dynamic> map) {
    return MaterialDetail(
        id: map['id'],
        material_name: map['material_name'],
        material_note: map['material_note'],
        material_registration_number: map['material_registration_number'],
        model_name: map['model_name'],
        model_weight: map['model_weight'],
        model_type: map['model_type'],
        brand_name: map['brand_name'],
        material_status: map['material_status']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();
    map.addAll({
      'material_name': material_name,
      'material_note': material_note,
      'material_registration_number': material_registration_number,
      'model_name': model_name,
      'model_weight': model_weight,
      'model_type': model_type,
      'brand_name': brand_name,
      'material_status': material_status,
      'material_start_date': Tracker.encode(material_start_date),
      'material_end_date': Tracker.encode(material_end_date),
    });
    map.removeWhere((key, value) => value == null);
    return map;
  }

  String toJson() => json.encode(toMap());

  factory MaterialDetail.fromJson(String source) {
    return MaterialDetail.fromMap(json.decode(source));
  }
}