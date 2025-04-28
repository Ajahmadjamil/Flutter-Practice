class AddEditOrderResponse {
  AddEditOrderResponse({
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

  factory AddEditOrderResponse.fromJson(Map<String, dynamic> json){
    return AddEditOrderResponse(
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
    required this.customerId,
    required this.statusId,
    required this.orderDate,
    required this.dailyorderId,
    required this.subTotal,
    required this.deliveryCharge,
    required this.serviceCharge,
    required this.discountId,
    required this.discountPer,
    required this.discountAmount,
    required this.taxInclude,
    required this.taxPercent,
    required this.taxAmount,
    required this.taxDiscount,
    required this.total,
    required this.amountPaid,
    required this.amountReturn,
    required this.notes,
    required this.restaurantBranch,
    required this.deliveryAddressId,
    required this.timeFrameId,
    required this.imageUrl,
    required this.orderType,
    required this.tableNo,
    required this.praInvoiceNumber,
    required this.paymentType,
    required this.shiftId,
    required this.restaurantBankId,
    required this.orderTaker,
    required this.address,
    required this.customer,
    required this.orderDetails,
    required this.orderBranchTables,
  });

  final int? id;
  final int? customerId;
  final int? statusId;
  final DateTime? orderDate;
  final int? dailyorderId;
  final String? subTotal;
  final String? deliveryCharge;
  final String? serviceCharge;
  final dynamic discountId;
  final String? discountPer;
  final String? discountAmount;
  final bool? taxInclude;
  final String? taxPercent;
  final String? taxAmount;
  final dynamic taxDiscount;
  final String? total;
  final String? amountPaid;
  final String? amountReturn;
  final dynamic notes;
  final RestaurantBranch? restaurantBranch;
  final int? deliveryAddressId;
  final int? timeFrameId;
  final String? imageUrl;
  final OrderType? orderType;
  final String? tableNo;
  final dynamic praInvoiceNumber;
  final PaymentType? paymentType;
  final dynamic shiftId;
  final dynamic restaurantBankId;
  final OrderTaker? orderTaker;
  final dynamic address;
  final Customer? customer;
  final List<Detail> orderDetails;
  final List<OrderBranchTable> orderBranchTables;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"],
      customerId: json["customer_id"],
      statusId: json["status_id"],
      orderDate: DateTime.tryParse(json["order_date"] ?? ""),
      dailyorderId: json["dailyorder_id"],
      subTotal: json["sub_total"],
      deliveryCharge: json["delivery_charge"],
      serviceCharge: json["service_charge"],
      discountId: json["discount_id"],
      discountPer: json["discount_per"],
      discountAmount: json["discount_amount"],
      taxInclude: json["tax_include"],
      taxPercent: json["tax_percent"],
      taxAmount: json["tax_amount"],
      taxDiscount: json["tax_discount"],
      total: json["total"],
      amountPaid: json["amount_paid"],
      amountReturn: json["amount_return"],
      notes: json["notes"],
      restaurantBranch: json["restaurant_branch"] == null ? null : RestaurantBranch.fromJson(json["restaurant_branch"]),
      deliveryAddressId: json["delivery_address_id"],
      timeFrameId: json["time_frame_id"],
      imageUrl: json["image_url"],
      orderType: json["order_type"] == null ? null : OrderType.fromJson(json["order_type"]),
      tableNo: json["table_no"],
      praInvoiceNumber: json["pra_invoice_number"],
      paymentType: json["payment_type"] == null ? null : PaymentType.fromJson(json["payment_type"]),
      shiftId: json["shift_id"],
      restaurantBankId: json["restaurant_bank_id"],
      orderTaker: json["order_taker"] == null ? null : OrderTaker.fromJson(json["order_taker"]),
      address: json["address"],
      customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
      orderDetails: json["order_details"] == null ? [] : List<Detail>.from(json["order_details"]!.map((x) => Detail.fromJson(x))),
      orderBranchTables: json["order_branch_tables"] == null ? [] : List<OrderBranchTable>.from(json["order_branch_tables"]!.map((x) => OrderBranchTable.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "status_id": statusId,
    "order_date": orderDate?.toIso8601String(),
    "dailyorder_id": dailyorderId,
    "sub_total": subTotal,
    "delivery_charge": deliveryCharge,
    "service_charge": serviceCharge,
    "discount_id": discountId,
    "discount_per": discountPer,
    "discount_amount": discountAmount,
    "tax_include": taxInclude,
    "tax_percent": taxPercent,
    "tax_amount": taxAmount,
    "tax_discount": taxDiscount,
    "total": total,
    "amount_paid": amountPaid,
    "amount_return": amountReturn,
    "notes": notes,
    "restaurant_branch": restaurantBranch?.toJson(),
    "delivery_address_id": deliveryAddressId,
    "time_frame_id": timeFrameId,
    "image_url": imageUrl,
    "order_type": orderType?.toJson(),
    "table_no": tableNo,
    "pra_invoice_number": praInvoiceNumber,
    "payment_type": paymentType?.toJson(),
    "shift_id": shiftId,
    "restaurant_bank_id": restaurantBankId,
    "order_taker": orderTaker?.toJson(),
    "address": address,
    "customer": customer?.toJson(),
    "order_details": orderDetails.map((x) => x?.toJson()).toList(),
    "order_branch_tables": orderBranchTables.map((x) => x?.toJson()).toList(),
  };

}

class Customer {
  Customer({
    required this.id,
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.gender,
    required this.dateBirth,
    required this.email,
    required this.cellNum,
  });

  final int? id;
  final String? customerId;
  final String? firstName;
  final String? lastName;
  final String? name;
  final String? gender;
  final DateTime? dateBirth;
  final String? email;
  final String? cellNum;

  factory Customer.fromJson(Map<String, dynamic> json){
    return Customer(
      id: json["id"],
      customerId: json["customer_id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      name: json["name"],
      gender: json["gender"],
      dateBirth: DateTime.tryParse(json["date_birth"] ?? ""),
      email: json["email"],
      cellNum: json["cell_num"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "first_name": firstName,
    "last_name": lastName,
    "name": name,
    "gender": gender,
    "date_birth": dateBirth?.toIso8601String(),
    "email": email,
    "cell_num": cellNum,
  };

}

class OrderBranchTable {
  OrderBranchTable({
    required this.orderTableId,
    required this.branchTableId,
    required this.tableName,
  });

  final int? orderTableId;
  final int? branchTableId;
  final String? tableName;

  factory OrderBranchTable.fromJson(Map<String, dynamic> json){
    return OrderBranchTable(
      orderTableId: json["order_table_id"],
      branchTableId: json["branch_table_id"],
      tableName: json["table_name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "order_table_id": orderTableId,
    "branch_table_id": branchTableId,
    "table_name": tableName,
  };

}

class Detail {
  Detail({
    required this.id,
    required this.menuId,
    required this.menuName,
    required this.price,
    required this.quantity,
    required this.note,
    required this.isPrintedInKitchen,
    required this.kitchenPrintQuantity,
    required this.orderDetailStatusId,
    required this.orderDetailStatus,
    required this.preparationTimeMinutes,
    required this.dateCreated,
    required this.menuVariation,
    required this.orderDetailChoice,
    required this.dealDetails,
  });

  final int? id;
  final int? menuId;
  final String? menuName;
  final String? price;
  final String? quantity;
  final dynamic note;
  final dynamic isPrintedInKitchen;
  final String? kitchenPrintQuantity;
  final int? orderDetailStatusId;
  final String? orderDetailStatus;
  final int? preparationTimeMinutes;
  final DateTime? dateCreated;
  final MenuVariation? menuVariation;
  final List<OrderDetailChoice> orderDetailChoice;
  final List<Detail> dealDetails;

  factory Detail.fromJson(Map<String, dynamic> json){
    return Detail(
      id: json["id"],
      menuId: json["menu_id"],
      menuName: json["menu_name"],
      price: json["price"],
      quantity: json["quantity"],
      note: json["note"],
      isPrintedInKitchen: json["is_printed_in_kitchen"],
      kitchenPrintQuantity: json["kitchen_print_quantity"],
      orderDetailStatusId: json["order_detail_status_id"],
      orderDetailStatus: json["order_detail_status"],
      preparationTimeMinutes: json["preparation_time_minutes"],
      dateCreated: DateTime.tryParse(json["date_created"] ?? ""),
      menuVariation: json["menu_variation"] == null ? null : MenuVariation.fromJson(json["menu_variation"]),
      orderDetailChoice: json["order_detail_choice"] == null ? [] : List<OrderDetailChoice>.from(json["order_detail_choice"]!.map((x) => OrderDetailChoice.fromJson(x))),
      dealDetails: json["deal_details"] == null ? [] : List<Detail>.from(json["deal_details"]!.map((x) => Detail.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "menu_id": menuId,
    "menu_name": menuName,
    "price": price,
    "quantity": quantity,
    "note": note,
    "is_printed_in_kitchen": isPrintedInKitchen,
    "kitchen_print_quantity": kitchenPrintQuantity,
    "order_detail_status_id": orderDetailStatusId,
    "order_detail_status": orderDetailStatus,
    "preparation_time_minutes": preparationTimeMinutes,
    "date_created": dateCreated?.toIso8601String(),
    "menu_variation": menuVariation?.toJson(),
    "order_detail_choice": orderDetailChoice.map((x) => x?.toJson()).toList(),
    "deal_details": dealDetails.map((x) => x?.toJson()).toList(),
  };

}

class MenuVariation {
  MenuVariation({
    required this.id,
    required this.name,
    required this.price,
    required this.takeAwayPrice,
    required this.deliveryPrice,
  });

  final int? id;
  final String? name;
  final String? price;
  final String? takeAwayPrice;
  final String? deliveryPrice;

  factory MenuVariation.fromJson(Map<String, dynamic> json){
    return MenuVariation(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      takeAwayPrice: json["take_away_price"],
      deliveryPrice: json["delivery_price"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "take_away_price": takeAwayPrice,
    "delivery_price": deliveryPrice,
  };

}

class OrderDetailChoice {
  OrderDetailChoice({
    required this.id,
    required this.choiceName,
    required this.choiceId,
    required this.price,
  });

  final int? id;
  final String? choiceName;
  final int? choiceId;
  final String? price;

  factory OrderDetailChoice.fromJson(Map<String, dynamic> json){
    return OrderDetailChoice(
      id: json["id"],
      choiceName: json["choice_name"],
      choiceId: json["choice_id"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "choice_name": choiceName,
    "choice_id": choiceId,
    "price": price,
  };

}

class OrderTaker {
  OrderTaker({
    required this.id,
    required this.userId,
    required this.name,
  });

  final int? id;
  final String? userId;
  final String? name;

  factory OrderTaker.fromJson(Map<String, dynamic> json){
    return OrderTaker(
      id: json["id"],
      userId: json["user_id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
  };

}

class OrderType {
  OrderType({
    required this.id,
    required this.type,
  });

  final int? id;
  final String? type;

  factory OrderType.fromJson(Map<String, dynamic> json){
    return OrderType(
      id: json["id"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
  };

}

class PaymentType {
  PaymentType({
    required this.id,
    required this.type,
    required this.description,
  });

  final int? id;
  final String? type;
  final String? description;

  factory PaymentType.fromJson(Map<String, dynamic> json){
    return PaymentType(
      id: json["id"],
      type: json["type"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "description": description,
  };

}

class RestaurantBranch {
  RestaurantBranch({
    required this.id,
    required this.name,
    required this.address,
    required this.logo,
    required this.phoneNumber,
    required this.ntnNumber,
    required this.strnNumber,
    required this.restaurantId,
  });

  final int? id;
  final String? name;
  final String? address;
  final String? logo;
  final String? phoneNumber;
  final dynamic ntnNumber;
  final dynamic strnNumber;
  final int? restaurantId;

  factory RestaurantBranch.fromJson(Map<String, dynamic> json){
    return RestaurantBranch(
      id: json["id"],
      name: json["name"],
      address: json["address"],
      logo: json["logo"],
      phoneNumber: json["phone_number"],
      ntnNumber: json["ntn_number"],
      strnNumber: json["strn_number"],
      restaurantId: json["restaurant_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "logo": logo,
    "phone_number": phoneNumber,
    "ntn_number": ntnNumber,
    "strn_number": strnNumber,
    "restaurant_id": restaurantId,
  };

}
