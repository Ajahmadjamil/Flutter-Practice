import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;
  var isClicked = false.obs;

  Future<void> makePayment() async {
    try {
      isClicked.value = true;
      paymentIntentData = await createPaymentIntent('20', 'USD');
      if (paymentIntentData == null) {
        Get.snackbar("Error", "Failed to create payment intent");
        return;
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          merchantDisplayName: "ahmad",
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            testEnv: true, // true for testing
          ),
          // applePay: const PaymentSheetApplePay(
          //   merchantCountryCode: 'US',
          // ),
        ),
      );

      if (kDebugMode) print('Payment sheet initialized');

      await displayPaymentSheet();
    } catch (e) {
      isClicked.value = false;
      if (kDebugMode) print("makePayment error: $e");
      Get.snackbar("Error", "Payment initialization failed");
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      if (kDebugMode) print('Payment successful');

      paymentIntentData = null; // reset
      isClicked.value = false;

      Get.snackbar("Paid", "Payment made Successfully");
    } on StripeException catch (e) {
      isClicked.value = false;
      if (kDebugMode) print("Stripe Exception: $e");
      Get.snackbar("Payment Failed", e.error.localizedMessage ?? "Something went wrong");
    } catch (e) {
      isClicked.value = false;
      if (kDebugMode) print("Unexpected error: $e");
      Get.snackbar("Error", "Unexpected error occurred");
    }
  }

  String calculateAmount(String amount) {
    final price = int.parse(amount) * 100; // Stripe expects amount in cents
    return price.toString();
  }

  Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        "currency": currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization':
              'Bearer sk_test_51RxRqRRyIzZk0v3g56V0xRiaf9GYoDktLf9gHJm4GrBAAQi5rxuzheAAIlnOitsRdikHCRgyEozA88hGNanZljch00zA32vxw3',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      isClicked.value = false;

      return jsonDecode(response.body);
    } catch (e) {
      isClicked.value = false;
      if (kDebugMode) print("createPaymentIntent error: $e");
      return null;
    }
  }
}
