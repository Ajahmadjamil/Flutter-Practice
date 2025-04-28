class GetOrdersResponse {
  GetOrdersResponse({
    required this.errorMessage,
    required this.message,
    required this.success,
    required this.data,
    required this.status,
  });

  final String? errorMessage;
  final String? message;
  final bool? success;
  final List<Data> data;
  final int? status;

  factory GetOrdersResponse.fromJson(Map<String, dynamic> json){
    return GetOrdersResponse(
      errorMessage: json["ErrorMessage"],
      message: json["Message"],
      success: json["Success"],
      data: json["Data"] == null ? [] : List<Data>.from(json["Data"]!.map((x) => Data.fromJson(x))),
      status: json["Status"],
    );
  }

  Map<String, dynamic> toJson() => {
    "ErrorMessage": errorMessage,
    "Message": message,
    "Success": success,
    "Data": data.map((x) => x?.toJson()).toList(),
    "Status": status,
  };

}

class Data {
  Data({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.restaurantBranchId,
    required this.restaurantBranchName,
    required this.restaurantId,
    required this.isCompleted,
    required this.isPaid,
    required this.total,
    required this.subTotal,
    required this.orderTypeId,
    required this.orderDate,
    required this.tableNo,
    required this.amountPaid,
    required this.orderResource,
    required this.resourceName,
    required this.paymentTypeId,
    required this.orderType,
    required this.statusId,
    required this.dailyorderId,
    required this.createdbyId,
    required this.orderStatus,
    required this.address,
  });

  final int? id;
  final int? customerId;
  final String? customerName;
  final int? restaurantBranchId;
  final String? restaurantBranchName;
  final int? restaurantId;
  final int? isCompleted;
  final int? isPaid;
  final String? total;
  final String? subTotal;
  final int? orderTypeId;
  final DateTime? orderDate;
  final String? tableNo;
  final String? amountPaid;
  final int? orderResource;
  final String? resourceName;
  final int? paymentTypeId;
  final String? orderType;
  final int? statusId;
  final int? dailyorderId;
  final int? createdbyId;
  final String? orderStatus;
  final dynamic address;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"],
      customerId: json["customer_id"],
      customerName: json["customer_name"],
      restaurantBranchId: json["restaurant_branch_id"],
      restaurantBranchName: json["restaurant_branch_name"],
      restaurantId: json["restaurant_id"],
      isCompleted: json["is_completed"],
      isPaid: json["is_paid"],
      total: json["total"],
      subTotal: json["sub_total"],
      orderTypeId: json["order_type_id"],
      orderDate: DateTime.tryParse(json["order_date"] ?? ""),
      tableNo: json["table_no"],
      amountPaid: json["amount_paid"],
      orderResource: json["order_resource"],
      resourceName: json["resource_name"],
      paymentTypeId: json["payment_type_id"],
      orderType: json["order_type"],
      statusId: json["status_id"],
      dailyorderId: json["dailyorder_id"],
      createdbyId: json["createdby_id"],
      orderStatus: json["order_status"],
      address: json["address"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "customer_name": customerName,
    "restaurant_branch_id": restaurantBranchId,
    "restaurant_branch_name": restaurantBranchName,
    "restaurant_id": restaurantId,
    "is_completed": isCompleted,
    "is_paid": isPaid,
    "total": total,
    "sub_total": subTotal,
    "order_type_id": orderTypeId,
    "order_date": orderDate?.toIso8601String(),
    "table_no": tableNo,
    "amount_paid": amountPaid,
    "order_resource": orderResource,
    "resource_name": resourceName,
    "payment_type_id": paymentTypeId,
    "order_type": orderType,
    "status_id": statusId,
    "dailyorder_id": dailyorderId,
    "createdby_id": createdbyId,
    "order_status": orderStatus,
    "address": address,
  };

}
