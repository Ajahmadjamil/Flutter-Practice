
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


import '../Model/AddEditAddressObject.dart';
import '../Model/AddEditCustomer.dart';
import '../Model/OrderPlaceObject.dart';
import '../Utils/Constants.dart';
import 'ApiEndpoints.dart';

class ApiServices {
  Future<http.Response> login(
      {required String email, required String password}) async {
    var uri = Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.login}");

    var body = {"username": email, "password": password};
    var response = await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
    return response;
  }

  Future<http.Response> getOrderOfBranch() async {
    var uri =
        Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.getOrderOfBranch}");

    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${Constants.token}",
      },
    );

    if (kDebugMode) {
      print("ResponseOrders: ${response.body}");
    }

    return response;
  }

  Future<http.Response> getOrderById(int orderId) async {
    var uri = Uri.parse(
        "${ApiEndPoints.baseUrl}${ApiEndPoints.getOrderById}?order_id=$orderId");
    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${Constants.token}",
        "Content-Type": "application/0json",
      },
    );
    return response;
  }

  Future<http.Response> getKitchenOrderById(int orderId) async {
    var uri = Uri.parse(
        "${ApiEndPoints.baseUrl}${ApiEndPoints.getKitchenOrderById}?order_id=$orderId");
    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${Constants.token}",
        "Content-Type": "application/0json",
      },
    );
    return response;
  }

  Future<http.Response> getCustomer(String contactNo) async {
    var uri = Uri.parse(
        "${ApiEndPoints.baseUrl}${ApiEndPoints.getCustomer}?contact_no=$contactNo");
    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${Constants.token}",
        "Content-Type": "application/0json",
      },
    );
    return response;
  }

  Future<http.Response> getTowns() async {
    var uri = Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.getTowns}");
    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${Constants.token}",
        "Content-Type": "application/0json",
      },
    );
    return response;
  }

  Future<http.Response> getBlocksByTownId() async {
    var uri =
        Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.getBlocksByTownId}");
    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${Constants.token}",
        "Content-Type": "application/0json",
      },
    );
    return response;
  }

  Future<http.Response> getDiscount() async {
    var uri = Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.getDiscount}");
    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${Constants.token}",
        "Content-Type": "application/0json",
      },
    );
    return response;
  }

  Future<http.Response> getMenu() async {
    var uri = Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.getMenu}");
    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${Constants.token}",
        "Content-Type": "application/0json",
      },
    );
    return response;
  }

  Future<http.Response> getFloorTable() async {
    var uri = Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.getFloorTable}");
    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${Constants.token}",
        "Content-Type": "application/0json",
      },
    );
    return response;
  }

  Future<http.Response> getBanks() async {
    var uri = Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.getBanks}");
    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${Constants.token}",
        "Content-Type": "application/0json",
      },
    );
    return response;
  }

  Future<http.Response> getOrderStatus() async {
    var uri =
        Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.getOrderStatus}");
    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${Constants.token}",
        "Content-Type": "application/0json",
      },
    );
    return response;
  }

  Future<http.Response> getPaymentTypes() async {
    var uri =
        Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.getPaymentTypes}");
    var response = await http.get(
      uri,
      headers: {
        'Authorization': "Bearer ${Constants.token}",
        "Content-Type": "application/0json",
      },
    );
    return response;
  }

  Future<http.Response> addEditOrder(OrderPlaceObject obj) async {
    var uri = Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.addEditOrder}");
    var body = jsonEncode(obj.toJson());
    var response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    return response;
  }

  Future<http.Response> addEditCustomer(AddEditCustomerObject obj) async {
    var uri =
        Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.addEditCustomer}");
    var body = jsonEncode(obj.toJson());
    var response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    return response;
  }

  Future<http.Response> addEditAddress(AddEditAddressObject obj) async {
    var uri =
        Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.addEditAddress}");
    var body = jsonEncode(obj.toJson());
    var response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    return response;
  }

  Future<http.Response> updateOrderStatus(
      {required int orderId, required int statusId}) async {
    var uri =
        Uri.parse("${ApiEndPoints.baseUrl}${ApiEndPoints.updateOrderStatus}");

    var body = {"order_id": orderId, "status_id": statusId};
    var response = await http.post(uri,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
    return response;
  }

  Future<http.Response> markOrderDetailAsKitchenPrinted(
      {required List<int> orderDetailIds}) async {
    var uri = Uri.parse(
        "${ApiEndPoints.baseUrl}${ApiEndPoints.markOrderDetailAsKitchenPrinted}");

    var body = {"order_detail_ids": orderDetailIds};

    var response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }
}
