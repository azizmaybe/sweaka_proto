import 'dart:convert';

import '../../models/objectivehistory.dart';
import '../APIs/api.dart';

class ObjectiveHisotryRepository {
  static Future<List<ObjectiveHistory>> loadObjectiveHistoryonline(
      {int page = 1, List<ObjectiveHistory> previous_ObjectiveHistory = const []}) async {
    String url = "person/objective_history/";
    url += "?page=$page&actor=6c9a2009-733e-456a-9c86-5c616db40f47";

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

      List<ObjectiveHistory> Objective_History =
          List<ObjectiveHistory>.from(decodedJson['results'].map((e) => ObjectiveHistory.fromMap(
                e,
              )));
      return Objective_History;
    } catch (e) {
      print(e);
      print("error loading Objective History");
      return [];
    }
  }

}
