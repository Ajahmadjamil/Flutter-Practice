import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  print('tapped1');
                  await makePayment();
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Text('Open Payment Method'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent('20', 'USD');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          merchantDisplayName: "ahmad",
          // applePay: const PaymentSheetApplePay(
          //   merchantCountryCode: 'US',
          // ),
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            testEnv: true, // true for testing
          ),
        ),
      );
      print('tapped2');
      displayPaymentSheet();
    } catch (e) {
      print(e);
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      print('tapped3');

      setState(() {
        paymentIntentData = null;
      });

      Get.snackbar("Paid", "Payment made Successfully");
    } on StripeException catch (e) {
      print("Stripe Exception: $e");
    } catch (e) {
      print("Unexpected error: $e");
    }
  }


  calculateAmount(String amount) {
    final price = int.parse(amount) * 100;
    return price.toString();
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        "currency": currency,
        'payment_method_types[]': 'card', // Correct format for form-urlencoded
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51RxRqRRyIzZk0v3g56V0xRiaf9GYoDktLf9gHJm4GrBAAQi5rxuzheAAIlnOitsRdikHCRgyEozA88hGNanZljch00zA32vxw3',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body.toString());
    } catch (e) {
      print(e);
    }
  }
}
