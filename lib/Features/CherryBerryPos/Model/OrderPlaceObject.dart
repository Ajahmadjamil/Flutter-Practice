class OrderPlaceObject {
  OrderPlaceObject({
    required this.deliveryAddressId,
    required this.amountPaid,
    required this.amountReturn,
    required this.deliveryCharge,
    required this.discountAmount,
    required this.discountPer,
    required this.id,
    required this.isPraInvoice,
    required this.orderBranchTables,
    required this.orderDetails,
    required this.orderTypeId,
    required this.paymentTypeId,
    required this.restaurantBankId,
    required this.serviceCharge,
    required this.subTotal,
    required this.taxAmount,
    required this.taxInclude,
    required this.taxInvoice,
    required this.taxPercent,
    required this.total,
    required this.customerId,
  });

  final int? deliveryAddressId;
  final int? amountPaid;
  final int? amountReturn;
  final int? deliveryCharge;
  final int? discountAmount;
  final int? discountPer;
  final int? id;
  final int? isPraInvoice;
  final List<OrderBranchTable> orderBranchTables;
  final List<OrderDetail> orderDetails;
  final int? orderTypeId;
  final int? paymentTypeId;
  final int? restaurantBankId;
  final int? serviceCharge;
  final int? subTotal;
  final double? taxAmount;
  final int? taxInclude;
  final int? taxInvoice;
  final int? taxPercent;
  final double? total;
  final int? customerId;

  factory OrderPlaceObject.fromJson(Map<String, dynamic> json){
    return OrderPlaceObject(
      deliveryAddressId: json["delivery_address_id"],
      amountPaid: json["amount_paid"],
      amountReturn: json["amount_return"],
      deliveryCharge: json["delivery_charge"],
      discountAmount: json["discount_amount"],
      discountPer: json["discount_per"],
      id: json["id"],
      isPraInvoice: json["is_pra_invoice"],
      orderBranchTables: json["order_branch_tables"] == null ? [] : List<OrderBranchTable>.from(json["order_branch_tables"]!.map((x) => OrderBranchTable.fromJson(x))),
      orderDetails: json["order_details"] == null ? [] : List<OrderDetail>.from(json["order_details"]!.map((x) => OrderDetail.fromJson(x))),
      orderTypeId: json["order_type_id"],
      paymentTypeId: json["payment_type_id"],
      restaurantBankId: json["restaurant_bank_id"],
      serviceCharge: json["service_charge"],
      subTotal: json["sub_total"],
      taxAmount: json["tax_amount"],
      taxInclude: json["tax_include"],
      taxInvoice: json["tax_invoice"],
      taxPercent: json["tax_percent"],
      total: json["total"],
      customerId: json["customer_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "delivery_address_id": deliveryAddressId,
    "amount_paid": amountPaid,
    "amount_return": amountReturn,
    "delivery_charge": deliveryCharge,
    "discount_amount": discountAmount,
    "discount_per": discountPer,
    "id": id,
    "is_pra_invoice": isPraInvoice,
    "order_branch_tables": orderBranchTables.map((x) => x?.toJson()).toList(),
    "order_details": orderDetails.map((x) => x?.toJson()).toList(),
    "order_type_id": orderTypeId,
    "payment_type_id": paymentTypeId,
    "restaurant_bank_id": restaurantBankId,
    "service_charge": serviceCharge,
    "sub_total": subTotal,
    "tax_amount": taxAmount,
    "tax_include": taxInclude,
    "tax_invoice": taxInvoice,
    "tax_percent": taxPercent,
    "total": total,
    "customer_id": customerId,
  };

}

class OrderBranchTable {
  OrderBranchTable({
    required this.branchTableId,
    required this.orderTableId,
    required this.tableName,
  });

  final int? branchTableId;
  final int? orderTableId;
  final String? tableName;

  factory OrderBranchTable.fromJson(Map<String, dynamic> json){
    return OrderBranchTable(
      branchTableId: json["branch_table_id"],
      orderTableId: json["order_table_id"],
      tableName: json["table_name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "branch_table_id": branchTableId,
    "order_table_id": orderTableId,
    "table_name": tableName,
  };

}

class OrderDetail {
  OrderDetail({
    required this.dealDetails,
    required this.menuId,
    required this.menuName,
    required this.menuVariation,
    required this.orderDetailChoice,
    required this.id,
    required this.price,
    required this.quantity,
  });

  final List<dynamic> dealDetails;
  final int? menuId;
  final String? menuName;
  final MenuVariation? menuVariation;
  final List<OrderDetailChoice> orderDetailChoice;
  final int? id;
  final int? price;
  final int? quantity;

  factory OrderDetail.fromJson(Map<String, dynamic> json){
    return OrderDetail(
      dealDetails: json["deal_details"] == null ? [] : List<dynamic>.from(json["deal_details"]!.map((x) => x)),
      menuId: json["menu_id"],
      menuName: json["menu_name"],
      menuVariation: json["menu_variation"] == null ? null : MenuVariation.fromJson(json["menu_variation"]),
      orderDetailChoice: json["order_detail_choice"] == null ? [] : List<OrderDetailChoice>.from(json["order_detail_choice"]!.map((x) => OrderDetailChoice.fromJson(x))),
      id: json["id"],
      price: json["price"],
      quantity: json["quantity"],
    );
  }

  Map<String, dynamic> toJson() => {
    "deal_details": dealDetails.map((x) => x).toList(),
    "menu_id": menuId,
    "menu_name": menuName,
    "menu_variation": menuVariation?.toJson(),
    "order_detail_choice": orderDetailChoice.map((x) => x?.toJson()).toList(),
    "id": id,
    "price": price,
    "quantity": quantity,
  };

}

class MenuVariation {
  MenuVariation({
    required this.id,
    required this.name,
    required this.price,
  });

  final int? id;
  final String? name;
  final int? price;

  factory MenuVariation.fromJson(Map<String, dynamic> json){
    return MenuVariation(
      id: json["id"],
      name: json["name"],
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
  };

}

class OrderDetailChoice {
  OrderDetailChoice({
    required this.choiceGroupId,
    required this.choiceId,
    required this.choiceName,
    required this.price,
    required this.id,
    required this.orderDetailId,
  });

  final int? choiceGroupId;
  final int? choiceId;
  final String? choiceName;
  final int? price;
  final int? id;
  final int? orderDetailId;

  factory OrderDetailChoice.fromJson(Map<String, dynamic> json){
    return OrderDetailChoice(
      choiceGroupId: json["choice_group_id"],
      choiceId: json["choice_id"],
      choiceName: json["choice_name"],
      price: json["price"],
      id: json["id"],
      orderDetailId: json["order_detail_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "choice_group_id": choiceGroupId,
    "choice_id": choiceId,
    "choice_name": choiceName,
    "price": price,
    "id": id,
    "order_detail_id": orderDetailId,
  };

}
