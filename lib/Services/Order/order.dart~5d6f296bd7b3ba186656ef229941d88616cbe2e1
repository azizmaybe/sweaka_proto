import 'dart:convert';
import 'dart:developer';
import '../../models/order.dart';
import '../APIs/api.dart';



class OrdersRepository {
  static Future<List<Order>> loadOrdersOnline(
      {int page = 1,
      required bool onStart,
      List<Order> previous_orders = const []}) async {
    String url = "supervisor/orders/";
    url += "?page=$page";
    if (onStart) {
      url += "&sync_all=True";
    }

    try {
      final response = await MainApi.Get(url: url, );
      var decodedJson = json.decode(response!.body);
      print(decodedJson);
      int orders_count = decodedJson['count'] ?? 0;

if (orders_count == 0) {
  return [];
}

List<Order> orders =
List<Order>.from(decodedJson['results'].map((e) =>
    Order.fromMap(
      e,
    )));
      return orders;

      // int orders_count = decodedJson['count'] ?? 0;

      /** if (orders_count == 0) {
        return [];
      }

      List<Order> orders =
          List<Order>.from(decodedJson['results'].map((e) => Order.fromMap(
                e,
              )));

      List<Order> results = [...orders, ...previous_orders];
      if (results.length == orders_count) {
        return results;
      } else {
        return loadOrdersOnline(
            onStart: onStart, page: page + 1, previous_orders: results);
      }*/
    } catch (e) {
      print("error loading order");
      return [];
    }
    
  }

  static Future<List<Order>> loadTransactionsOnline(
      {int page = 1,
      required bool onStart,
      List<Order> previous_orders = const []}) async {
    String url = "seller/transactions/";
    url += "?page=$page";
    if (onStart) {
      url += "&sync_all=True";
    }
    try {
      final response = await MainApi.Get(url: url, );
      var decodedJson = json.decode(response!.body);

      List<Order> orders = [];

      int orders_count = decodedJson['count'];

      for (var i = 0; i < decodedJson['results'].length; i++) {
        orders.add(Order.fromMap(
          decodedJson['results'][i],
        ));
      }
      List<Order> results = [...orders, ...previous_orders];
      if (results.length == orders_count) {
        return results;
      } else {
        return loadTransactionsOnline(
            onStart: onStart, page: page + 1, previous_orders: results);
      }
    } catch (e) {
      print("error loading transactions");
      return [];
    }
  }

 /**  static Future<bool> add(Order order, Client? newclient,
      {String? code, String? note, bool clientpayment = false}) async {
    String url = "seller/transactions/";
    String key = "transactiondetail_set";
    Map<String, dynamic> body = order.toMap(post_request: true);
    if (order.is_order ?? true) {
      url = "seller/orders/";
      key = "orderdetail_set";
      url += "?sync_all=True";
    } else {
      if (order.transaction_type == TransactionType.Payment) {
        url = "seller/transactions/payment/";
        if (clientpayment) {
          body.remove('transaction_type');
          body.addAll({
            'transaction_type': 'Client Payment',
          });
        }
      }
    }
    Map<String, dynamic> subBody = {
      key: order.details.map((e) => e.forOrderMap()).toList()
    };
    body.addAll(subBody);
    if (order.is_order ?? true) {
      body.remove('transaction');
      body.remove('details');
    }

    // passing Client object to server
    body.remove('client');
    if (order.client != null && newclient != null) {
      Client client = newclient;
      // print(client.toMap());
      body.addAll({
        'client': client.toMap(),
      });
    }

    if (code != null) {
      body.addAll({
        'code': code,
      });
    }
    if (note != null) {
      body.addAll({
        'note': note,
      });
    }

    //print(body);
    try {
      final response = await MainApi.Post(body: body, url: url);
      bool res = response.statusCode == 200 || response.statusCode == 201;
      return res;
    } catch (e) {
      print("error adding order revoking operation");
      return false;
    }
  }

  static Future<bool> patch(Order order) async {
    String url = "seller/orders/${order.id}";
    url += "&sync_all=True";
    try {
      final response = await MainApi.Patch(body: order.toMap(), url: url);
      bool res = response.statusCode == 200 || response.statusCode == 201;
      return res;
    } catch (e) {
      print("error updating order revoking operation");
      return false;
    }
  }

  static Future<List<Order>> loadOrders() async {
    AppDatabase database = await $FloorAppDatabase.databaseBuilder().build();
    List<Order> res = await database.OrderDAo.retrieveOrders();
    if (res.isEmpty) {
      res = await loadOrdersOnline(onStart: true);
      saveOrders(res);
      log("loaded Orders from server " + res.length.toString());
      return res;
    }
    log("loaded Orders from database " + res.length.toString());
    return res;
  }

  static saveOrders(List<Order> orders) async {
    AppDatabase database = await $FloorAppDatabase.databaseBuilder().build();
    database.OrderDAo.insertOrders(orders);
  }

  static saveOrder(Order order) async {
    AppDatabase database = await $FloorAppDatabase.databaseBuilder().build();
    database.OrderDAo.insertOrder(order);
  }

  static clearDatabase() async {
    AppDatabase database = await $FloorAppDatabase.databaseBuilder().build();
    await database.OrderDAo.deleteOrders();
  }

  static delete(String order) async {
    AppDatabase database = await $FloorAppDatabase.databaseBuilder().build();
    database.OrderDAo.deleteOrder(order);
  }
  */ 
}