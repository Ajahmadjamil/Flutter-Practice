

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'ApiEndpoints.dart';

class ApiServices {

  Future<http.Response> getExcerciseDetail() async {
    var uri =
    Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.getExcerciseDetail}");

    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${ApiEndPoints.token}",
      },
    );

    if (kDebugMode) {
      print("ResponseOrders: ${response.body}");
    }

    return response;
  }
}