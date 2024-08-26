import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sweaka_supervisor_2/models/client.dart';
import 'package:sweaka_supervisor_2/models/seller.dart';


import '../../constants/sweakaColors.dart';
import '../models/tracker.dart';
import 'order_details.dart';

// 41 en attent de validation
// 51 en cours
// 61 livree
// 90 rejected
// 99 rejected

enum OrderStatue { awaitingValidation, pending, delivered, rejected }


class Order extends Tracker {
  int? display_id;
  String? note;
  num? paid;
  num? total_discount;
  DateTime? validated_at;
  num? total_price;
  num? total_tva;
  num? sub_total_price;
  DateTime? canceled_at;
  String? cancel_reason;
  Client? client;
  String? client_excuse;
  DateTime? pickup_at;
  bool? is_order;
  Seller? seller;
  String? costumer_note;
  String? pickup_text;
  String? pickup_image;
  String? destination_text;
  String? destination_image;
  DateTime? request_delivery_at;
  DateTime? planned_delivery_at;
  DateTime? delivered_at;
  OrderStatue? status;
  String? destination;
  String? transaction;
  List<OrderDetail> details;
  LatLng? location;

  DateTime? get deliveredat => delivered_at;

  num? get getPaid => paid;

  String? get cancelreason => cancel_reason;

  DateTime? get validatedat => validated_at;

  String? get clientexcuse => client_excuse;

  OrderStatue? get getStatus => status;

  set setPaid(num paid) {
    this.paid = paid;
    on_update();
  }

  set setvalidatedat(DateTime value) {
    validated_at = value;
    on_update();
  }

  set setcancelreason(String value) {
    cancel_reason = value;
    on_update();
  }

  set clientexcuse(value) {
    super.on_update();
    this.client_excuse = value;
  }

  set setdeliveredat(DateTime value) {
    delivered_at = value;
    on_update();
  }

  set setStatus(int? status) {
    this.status = encode(status);
    on_update();
  }

  void on_update() {
    print("Updating current Order ");
    super.on_update();
  }
Seller sellerObj = Seller();

   String get getRuntimeType {
    return Order(seller: sellerObj).runtimeType.toString();
  }

  String get getTitle {
    switch (status) {
      case OrderStatue.awaitingValidation:
        return "En attente de validation";
      case OrderStatue.pending:
        return "En cours";
      case OrderStatue.delivered:
        return "Livrée";
      case OrderStatue.rejected:
        return "Rejetée";
      default:
        return '';
    }
  }

  Color get getColor {
    switch (status) {
      case OrderStatue.awaitingValidation:
        return SweakaColors.light_text;
      case OrderStatue.pending:
        return SweakaColors.alert;
      case OrderStatue.delivered:
        return SweakaColors.success;
      case OrderStatue.rejected:
        return SweakaColors.alert;
      default:
        return SweakaColors.light_text;
    }
  }

  static OrderStatue encode(int? code) {
    if (code == null) return OrderStatue.pending;
    // 99 rejected
    switch (code) {
      case 41:
        return OrderStatue.awaitingValidation;
      case 51:
        return OrderStatue.pending;
      case 61:
        return OrderStatue.delivered;
      case 90:
        return OrderStatue.rejected;
      case 99:
        return OrderStatue.rejected;
      default:
        return OrderStatue.pending;
    }
  }

  static int decode(OrderStatue? statue) {
    if (statue == null) return 51;
    switch (statue) {
      case OrderStatue.awaitingValidation:
        return 41;
      case OrderStatue.pending:
        return 51;
      case OrderStatue.delivered:
        return 61;
      case OrderStatue.rejected:
        return 90;
    }
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
  }

  Order({
    List<OrderDetail>? details,
    String? id,
    DateTime? created_at,
    DateTime? updated_at,
    this.transaction,
    required this.seller,
    this.display_id,  
    this.note,
    this.paid,
    this.total_price,
    this.total_tva,
    this.sub_total_price,
    this.total_discount,
    this.validated_at,
    this.canceled_at,
    this.cancel_reason,
    this.client,
    this.client_excuse,
    this.location, 
    this.pickup_at,
    this.is_order = true,
    this.costumer_note,
    this.pickup_text,
    this.pickup_image,
    this.destination_text,
    this.destination_image,
    this.request_delivery_at,
    this.planned_delivery_at,
    this.delivered_at,
    this.status,
    this.destination,
  })  : this.details = details ?? [],
        super(created_at: created_at, id: id, updated_at: updated_at,) {
    log("Order created with location $location");
  }

  /**
   * post_request : this param is only for lost and damage transactions
   * Damage and lost transaction should be validated by manager or storekeeper
   */
  Map<String, dynamic> toMap({bool post_request = false}) {
    Map<String, dynamic> map = super.toMap();
    map.addAll({
      'location': encode_location(location!),
      "seller": seller,
      'display_id': display_id,
      'transaction': transaction,
      'note': note,
      'paid': paid,
      'details': details.map((e) => e.toMap()).toList(),
      'total_price': total_price,
      'total_tva': total_tva,
      'sub_total_price': sub_total_price,
      'total_discount': total_discount,
      'canceled_at': Tracker.encode(canceled_at),
      'cancel_reason': cancel_reason,
      'client': client,
      'client_excuse': client_excuse,
      'pickup_at': Tracker.encode(pickup_at),
      'is_order': is_order,
      'costumer_note': costumer_note,
      'pickup_text': pickup_text,
      'pickup_image': pickup_image,
      'destination_text': destination_text,
      'destination_image': destination_image,
      'request_delivery_at': Tracker.encode(request_delivery_at),
      'planned_delivery_at': Tracker.encode(planned_delivery_at),
      'delivered_at': Tracker.encode(delivered_at),
      'status': decode(status),
      'destination': destination,
    });
    /*   if (is_order ?? false) {
      map.remove('transaction');
    } */
    map.removeWhere((key, value) => value == null);
    return map;
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    List<OrderDetail> payload = [];
    try {
      payload = List<OrderDetail>.from(
          map['details'].map((e) => OrderDetail.fromMap(e)));
    } catch (e) {}

    return Order(
      seller: map['seller'] ?? "",
      transaction: map['transaction'],
      id: map['mobile_id'],
      details: payload,
      location: decode_location(map['location'] ??
          "SRID=4326;POINT (36.05866896551416 1.137781467381984)"),
      display_id: map['display_id'],
      created_at: Tracker.decode(map['created_at']),
      note: map['note'],
      paid: map['paid'],
      total_price: map['total_price'],
      total_tva: map['total_tva'],
      sub_total_price: map['sub_total_price'],
      total_discount: map['total_discount'],
      validated_at: Tracker.decode(map['validated_at']),
      canceled_at: Tracker.decode(map['canceled_at']),
      cancel_reason: map['cancel_reason'],
      client: map['client'],
      client_excuse: map['client_excuse'],
      updated_at: Tracker.decode(map['updated_at']),
      pickup_at: Tracker.decode(map['pickup_at']),
      is_order: map['is_order'] ?? false,
      costumer_note: map['costumer_note'],
      pickup_text: map['pickup_text'],
      pickup_image: map['pickup_image'],
      destination_text: map['destination_text'],
      destination_image: map['destination_image'],
      request_delivery_at: Tracker.decode(map['request_delivery_at']),
      planned_delivery_at: Tracker.decode(map['planned_delivery_at']),
      delivered_at: Tracker.decode(map['delivered_at']) ??
          Tracker.decode(map['planned_delivery_at']),
      status: encode(map['status']),
      destination: map['destination'],
    );
  }

  String get totalArticles {
    int res = 0;
    for (var item in details) {
      res += item.quantity ?? 0;
    }
    return res.toString();
  }

  String get totalQuantity {
    int res = 0;
    for (var item in details) {
      res += item.quantity ?? 0;
    }
    return res.toString();
  }

  Order copyWith({
    int? display_id,
    String? note,
    num? paid,
    num? total_discount,
    DateTime? validated_at,
    num? total_price,
    DateTime? canceled_at,
    String? cancel_reason,
    Client? client,
    String? client_excuse,
    DateTime? pickup_at,
    bool? is_order,
    Seller? seller,
    String? costumer_note,
    String? pickup_text,
    String? pickup_image,
    String? destination_text,
    String? destination_image,
    DateTime? request_delivery_at,
    DateTime? planned_delivery_at,
    DateTime? delivered_at,
    String? destination,
    String? transaction,
    List<OrderDetail>? details,
    LatLng? location,
    OrderStatue? status,
  }) {
    return Order(
      id: id ?? this.id,
      location: location ?? this.location,
      display_id: display_id ?? this.display_id,
      note: note ?? this.note,
      paid: paid ?? this.paid,
      total_discount: total_discount ?? this.total_discount,
      validated_at: validated_at ?? this.validated_at,
      total_price: total_price ?? this.total_price,
      canceled_at: canceled_at ?? this.canceled_at,
      cancel_reason: cancel_reason ?? this.cancel_reason,
      client: client ?? this.client,
      client_excuse: client_excuse ?? this.client_excuse,
      pickup_at: pickup_at ?? this.pickup_at,
      is_order: is_order ?? this.is_order,
      seller: seller ?? this.seller,
      costumer_note: costumer_note ?? this.costumer_note,
      pickup_text: pickup_text ?? this.pickup_text,
      pickup_image: pickup_image ?? this.pickup_image,
      destination_text: destination_text ?? this.destination_text,
      destination_image: destination_image ?? this.destination_image,
      request_delivery_at: request_delivery_at ?? this.request_delivery_at,
      planned_delivery_at: planned_delivery_at ?? this.planned_delivery_at,
      delivered_at: delivered_at ?? this.delivered_at,
      destination: destination ?? this.destination,
      transaction: transaction ?? this.transaction,
      details: details ?? this.details,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props {
    return [
      display_id ?? "",
      note ?? "",
      paid ?? "",
      total_discount ?? "",
      validated_at ?? "",
      total_price ?? "",
      canceled_at ?? "",
      cancel_reason ?? "",
      client ?? "",
      client_excuse ?? "",
      pickup_at ?? "",
      is_order ?? "",
      seller ?? "",
      costumer_note ?? "",
      pickup_text ?? "",
      pickup_image ?? "",
      destination_text ?? "",
      destination_image ?? "",
      request_delivery_at ?? "",
      planned_delivery_at ?? "",
      delivered_at ?? "",
      destination ?? "",
      transaction ?? "",
      details,
      id ?? "",
      updated_at ?? "",
      created_at ?? "",
      location ?? "",
    ];
  }
}
