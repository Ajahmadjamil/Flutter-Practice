class ApiEndPoints {
  static const String currency = "\$";
  static const String baseUrl = "https://dev-admin.cherryberrycloud.com/v2/api/pos/";
  // static const String baseUrl = "https://admin.efoodpal.co.uk/v2/api/pos/";

  static const String getOrderOfBranch = "get_today_orders_of_restaurant_branch";
  static const String getCustomer = "get_customer_by_contact";
  static const String getTowns = "get_towns";
  static const String getBlocksByTownId = "get_blocks_by_town_id";
  static const String getOrderById = "get_order_by_id";
  static const String getDiscount = "get_discounts";
  static const String getMenu = "get_restaurant_branch_menu";
  static const String getFloorTable = "get_floor_table_details";
  static const String getBanks = "get_banks";
  static const String getPaymentTypes = "get_payment_types";
  static const String getOrderStatus = "get_order_status";
  static const String getKitchenOrder = "get_kitchen_order_by_order_id";

  static const String login = "login";
  static const String addEditCustomer = "add_edit_customer";
  static const String addEditAddress = "add_edit_customer_address";
  static const String addEditOrder = "add_edit_order";
  static const String updateOrderStatus = "update_order_status";
  static const String markOrderDetailAsKitchenPrinted = "mark_order_detail_as_kitchen_printed";
  static const String getKitchenOrderById = "get_kitchen_order_by_order_id";


}
