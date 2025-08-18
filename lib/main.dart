import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractices/Features/ToDoReminder/db/DatabaseHelper.dart';
import 'package:flutterpractices/FeaturesScreen.dart';
import 'package:flutterpractices/firebase_options.dart';
import 'package:flutterpractices/pr.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'Features/StripePaymentMethod/PaymentMethodScreen.dart';
import 'Features/ToDoReminder/Themes/ThemeServices.dart';
import 'Features/ToDoReminder/Themes/Themes.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey ='pk_test_51RxRqRRyIzZk0v3gN1wJyPUFDH8WAZtwd7HosbrMXXXZIogZusPVsza9sXTCqNmS8LjIxjyBhfrMpias5Bdy5K9400G2LwPQu5';
  await Stripe.instance.applySettings();

  await DbHelper.initDb();
  await GetStorage.init();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Karachi'));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().themes, // set global theme mode
      home: const PaymentMethodScreen(),
      // home: const MyHomePage(),
    );
  }
}