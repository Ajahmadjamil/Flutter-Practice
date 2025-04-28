class LoginResponse {
  LoginResponse({
    required this.errorMessage,
    required this.message,
    required this.success,
    required this.data,
    required this.status,
  });

  final String? errorMessage;
  final String? message;
  final bool? success;
  final Data? data;
  final int? status;

  factory LoginResponse.fromJson(Map<String, dynamic> json){
    return LoginResponse(
      errorMessage: json["ErrorMessage"],
      message: json["Message"],
      success: json["Success"],
      data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
      status: json["Status"],
    );
  }

  Map<String, dynamic> toJson() => {
    "ErrorMessage": errorMessage,
    "Message": message,
    "Success": success,
    "Data": data?.toJson(),
    "Status": status,
  };

}

class Data {
  Data({
    required this.id,
    required this.token,
    required this.userId,
    required this.username,
    required this.name,
    required this.restaurantBranchId,
    required this.restaurantBranchIdd,
    required this.fixedDeliveryCharges,
    required this.fixedServiceCharges,
    required this.taxInclude,
    required this.taxPercent,
    required this.cardTaxPercent,
    required this.currency,
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantBranchLogoUrl,
    required this.isOrderByTown,
    required this.userRoleId,
    required this.rolename,
    required this.callCenterLogin,
    required this.callCenterPassword,
    required this.callCenterIp,
    required this.ntnNumber,
    required this.phoneNumber,
    required this.phoneNumber2,
    required this.phoneNumber3,
    required this.shiftId,
    required this.permissions,
  });

  final int? id;
  final String? token;
  final String? userId;
  final String? username;
  final String? name;
  final String? restaurantBranchId;
  final int? restaurantBranchIdd;
  final String? fixedDeliveryCharges;
  final String? fixedServiceCharges;
  final bool? taxInclude;
  final String? taxPercent;
  final String? cardTaxPercent;
  final String? currency;
  final String? restaurantId;
  final String? restaurantName;
  final String? restaurantBranchLogoUrl;
  final int? isOrderByTown;
  final int? userRoleId;
  final String? rolename;
  final dynamic callCenterLogin;
  final dynamic callCenterPassword;
  final dynamic callCenterIp;
  final dynamic ntnNumber;
  final String? phoneNumber;
  final dynamic phoneNumber2;
  final dynamic phoneNumber3;
  final int? shiftId;
  final Permissions? permissions;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"],
      token: json["token"],
      userId: json["user_id"],
      username: json["username"],
      name: json["name"],
      restaurantBranchId: json["restaurant_branch_id"],
      restaurantBranchIdd: json["restaurant_branch_idd"],
      fixedDeliveryCharges: json["fixed_delivery_charges"],
      fixedServiceCharges: json["fixed_service_charges"],
      taxInclude: json["tax_include"],
      taxPercent: json["tax_percent"],
      cardTaxPercent: json["card_tax_percent"],
      currency: json["currency"],
      restaurantId: json["restaurant_id"],
      restaurantName: json["restaurant_name"],
      restaurantBranchLogoUrl: json["restaurant_branch_logo_url"],
      isOrderByTown: json["is_order_by_town"],
      userRoleId: json["user_role_id"],
      rolename: json["rolename"],
      callCenterLogin: json["call_center_login"],
      callCenterPassword: json["call_center_password"],
      callCenterIp: json["call_center_ip"],
      ntnNumber: json["ntn_number"],
      phoneNumber: json["phone_number"],
      phoneNumber2: json["phone_number2"],
      phoneNumber3: json["phone_number3"],
      shiftId: json["shift_id"],
      permissions: json["permissions"] == null ? null : Permissions.fromJson(json["permissions"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
    "user_id": userId,
    "username": username,
    "name": name,
    "restaurant_branch_id": restaurantBranchId,
    "restaurant_branch_idd": restaurantBranchIdd,
    "fixed_delivery_charges": fixedDeliveryCharges,
    "fixed_service_charges": fixedServiceCharges,
    "tax_include": taxInclude,
    "tax_percent": taxPercent,
    "card_tax_percent": cardTaxPercent,
    "currency": currency,
    "restaurant_id": restaurantId,
    "restaurant_name": restaurantName,
    "restaurant_branch_logo_url": restaurantBranchLogoUrl,
    "is_order_by_town": isOrderByTown,
    "user_role_id": userRoleId,
    "rolename": rolename,
    "call_center_login": callCenterLogin,
    "call_center_password": callCenterPassword,
    "call_center_ip": callCenterIp,
    "ntn_number": ntnNumber,
    "phone_number": phoneNumber,
    "phone_number2": phoneNumber2,
    "phone_number3": phoneNumber3,
    "shift_id": shiftId,
    "permissions": permissions?.toJson(),
  };

}

class Permissions {
  Permissions({
    required this.orderList,
    required this.orderHistory,
    required this.paidAllow,
    required this.reportAllow,
    required this.reservationAllow,
    required this.kitchenStatus,
    required this.riderAllow,
    required this.discountAllow,
    required this.orderEdit,
  });

  final DiscountAllow? orderList;
  final DiscountAllow? orderHistory;
  final DiscountAllow? paidAllow;
  final DiscountAllow? reportAllow;
  final DiscountAllow? reservationAllow;
  final DiscountAllow? kitchenStatus;
  final DiscountAllow? riderAllow;
  final DiscountAllow? discountAllow;
  final DiscountAllow? orderEdit;

  factory Permissions.fromJson(Map<String, dynamic> json){
    return Permissions(
      orderList: json["order_list"] == null ? null : DiscountAllow.fromJson(json["order_list"]),
      orderHistory: json["order_history"] == null ? null : DiscountAllow.fromJson(json["order_history"]),
      paidAllow: json["paid_allow"] == null ? null : DiscountAllow.fromJson(json["paid_allow"]),
      reportAllow: json["report_allow"] == null ? null : DiscountAllow.fromJson(json["report_allow"]),
      reservationAllow: json["reservation_allow"] == null ? null : DiscountAllow.fromJson(json["reservation_allow"]),
      kitchenStatus: json["kitchen_status"] == null ? null : DiscountAllow.fromJson(json["kitchen_status"]),
      riderAllow: json["rider_allow"] == null ? null : DiscountAllow.fromJson(json["rider_allow"]),
      discountAllow: json["discount_allow"] == null ? null : DiscountAllow.fromJson(json["discount_allow"]),
      orderEdit: json["order_edit"] == null ? null : DiscountAllow.fromJson(json["order_edit"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "order_list": orderList?.toJson(),
    "order_history": orderHistory?.toJson(),
    "paid_allow": paidAllow?.toJson(),
    "report_allow": reportAllow?.toJson(),
    "reservation_allow": reservationAllow?.toJson(),
    "kitchen_status": kitchenStatus?.toJson(),
    "rider_allow": riderAllow?.toJson(),
    "discount_allow": discountAllow?.toJson(),
    "order_edit": orderEdit?.toJson(),
  };

}

class DiscountAllow {
  DiscountAllow({
    required this.permissionId,
    required this.permissionName,
    required this.canAccess,
    required this.canRead,
    required this.canCreate,
    required this.canEdit,
    required this.canDelete,
    required this.canPost,
  });

  final int? permissionId;
  final String? permissionName;
  final int? canAccess;
  final int? canRead;
  final int? canCreate;
  final int? canEdit;
  final int? canDelete;
  final int? canPost;

  factory DiscountAllow.fromJson(Map<String, dynamic> json){
    return DiscountAllow(
      permissionId: json["permission_id"],
      permissionName: json["permission_name"],
      canAccess: json["can_access"],
      canRead: json["can_read"],
      canCreate: json["can_create"],
      canEdit: json["can_edit"],
      canDelete: json["can_delete"],
      canPost: json["can_post"],
    );
  }

  Map<String, dynamic> toJson() => {
    "permission_id": permissionId,
    "permission_name": permissionName,
    "can_access": canAccess,
    "can_read": canRead,
    "can_create": canCreate,
    "can_edit": canEdit,
    "can_delete": canDelete,
    "can_post": canPost,
  };

}
