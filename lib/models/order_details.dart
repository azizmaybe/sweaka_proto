import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

import '../models/tracker.dart';

@entity
class OrderDetail extends Tracker with EquatableMixin {

  int? display_id;
  DateTime? mobile_created_at;
  int? unit;
  num? tva;
  num? price;
  int? quantity;
  num? price_discount;
  String product_id;
  String? order;

  // if order is null then it is transaction detail and vice versa
  String? transaction;

  OrderDetail({
    DateTime? created_at,
    DateTime? updated_at,
    String? id,
    this.display_id,
    this.transaction,
    this.mobile_created_at,
    this.unit,
    this.tva,
    this.price,
    this.quantity,
    this.order,
    this.price_discount,
    required this.product_id,
  })  : super(created_at: created_at, id: id, updated_at: updated_at);

  set setQuantity(int quantity) {
    this.quantity = quantity;
    on_update();
  }

  void on_update() {
    print("Updating current Order ");
    super.on_update();
  }

  static String get getRuntimeType {
    return OrderDetail(
      product_id: "",
    ).runtimeType.toString();
  }

  factory OrderDetail.fromMap(
    Map<String, dynamic> map,
  ) {
    return OrderDetail(
        id: map['mobile_id'],
        order: map['order'] ?? "",
        display_id: map['display_id'],
        mobile_created_at: map['mobile_created_at'],
        unit: map['unit'],
        price: map['price'],
        tva: map['tva'],
        quantity: map['quantity'],
        price_discount: map['price_discount'],
        product_id: map['product'] ?? "",
        transaction: map['transaction']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();
    map.addAll({
      'display_id': display_id,
      'mobile_created_at': mobile_created_at,
      'unit': unit,
      'price': price,
      'tva': tva,
      'quantity': quantity,
      'price_discount': price_discount,
      'product': product_id,
      'order': order,
      'transaction': transaction,
    });
    map.removeWhere((key, value) => value == null);
    return map;
  }

  Map<String, dynamic> forOrderMap() {
    Map<String, dynamic> map = super.toMap();
    map.addAll({
      'display_id': display_id,
      'mobile_created_at': mobile_created_at,
      'unit': unit,
      'price': price,
      'tva': tva,
      'quantity': quantity,
      'price_discount': price_discount,
      'product': product_id,
      'order': order,
      'transaction': transaction,
    });
    map.removeWhere((key, value) => value == null);
    return map;
  }

  String toJson() => json.encode(toMap());

  factory OrderDetail.fromJson(String source) =>
      OrderDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderDetail:\n unit: $unit, price: $price, quantity: $quantity, tva : $tva , price_discount: $price_discount, product: $product_id, order: $order, transaction: $transaction';
  }

  OrderDetail copyWith({
    int? display_id,
    DateTime? mobile_created_at,
    int? unit,
    num? tva,
    num? price,
    int? quantity,
    num? price_discount,
    String? product_id,
    String? order,
    String? transaction,
  }) {
    return OrderDetail(
      display_id: display_id ?? this.display_id,
      mobile_created_at: mobile_created_at ?? this.mobile_created_at,
      unit: unit ?? this.unit,
      tva: tva ?? this.tva,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      price_discount: price_discount ?? this.price_discount,
      product_id: product_id ?? this.product_id,
      order: order ?? this.order,
      transaction: transaction ?? this.transaction,
    );
  }

  @override
  List<Object> get props {
    return [
      display_id ?? "",
      mobile_created_at ?? "",
      unit ?? "",
      price ?? "",
      tva ?? "",
      quantity ?? "",
      price_discount ?? "",
      product_id,
      order ?? "",
      transaction ?? "",
      id ?? "",
      updated_at ?? "",
      created_at ?? "",
    ];
  }
}