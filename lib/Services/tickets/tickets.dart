import 'dart:convert';


import '../../models/tickets.dart';
import '../APIs/api.dart';

class TicketsRepository {
  static Future<List<Ticket>> loadTicketsOnline(
      {int page = 1, List<Ticket> previous_Tickets = const []}) async {
    String url = "shared/tickets/";
    url += "?page=$page&person_id=7954d0e7-9a9d-4409-9960-8a07b8f92700";

    try {
      final response = await MainApi.Get(
        url: url,
      );
      var decodedJson = json.decode(response!.body);
      print(decodedJson);
      int orders_count = decodedJson['count'] ?? 0;

      if (orders_count == 0) {
        return [];
      }

      List<Ticket> Tickets =
          List<Ticket>.from(decodedJson['results'].map((e) => Ticket.fromMap(
                e,
              )));
      return Tickets;
    } catch (e) {
      print(e);
      print("error loading Tickets");
      return [];
    }
  }
}
