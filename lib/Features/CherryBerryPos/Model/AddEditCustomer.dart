class AddEditCustomerObject {
  AddEditCustomerObject({
    required this.cellNum,
    required this.customerId,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  final String? cellNum;
  final String? customerId;
  final String? email;
  final String? firstName;
  final String? lastName;

  factory AddEditCustomerObject.fromJson(Map<String, dynamic> json){
    return AddEditCustomerObject(
      cellNum: json["cell_num"],
      customerId: json["customer_id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "cell_num": cellNum,
    "customer_id": customerId,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
  };

}
