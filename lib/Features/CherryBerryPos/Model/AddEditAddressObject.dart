class AddEditAddressObject {
  AddEditAddressObject({
    required this.address1,
    required this.addressId,
    required this.addressTypeId,
    required this.customerId,
    required this.isDefault,
    required this.latitude,
    required this.longitude,
    required this.townBlockId,
    required this.townId,
  });

  final String? address1;
  final String? addressId;
  final int? addressTypeId;
  final String? customerId;
  final int? isDefault;
  final String? latitude;
  final String? longitude;
  final int? townBlockId;
  final int? townId;

  factory AddEditAddressObject.fromJson(Map<String, dynamic> json){
    return AddEditAddressObject(
      address1: json["address1"],
      addressId: json["address_id"],
      addressTypeId: json["address_type_id"],
      customerId: json["customer_id"],
      isDefault: json["is_default"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      townBlockId: json["town_block_id"],
      townId: json["town_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "address1": address1,
    "address_id": addressId,
    "address_type_id": addressTypeId,
    "customer_id": customerId,
    "is_default": isDefault,
    "latitude": latitude,
    "longitude": longitude,
    "town_block_id": townBlockId,
    "town_id": townId,
  };

}
