import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'Features/ToDoReminder/db/DatabaseHelper.dart';
import 'Features/ToDoReminder/Themes/ThemeServices.dart';
import 'Features/ToDoReminder/Themes/Themes.dart';
import 'FeaturesScreen.dart';
import 'firebase_options.dart';
import 'pr.dart';

// background service import
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Stripe setup
  Stripe.publishableKey =
      'pk_test_51RxRqRRyIzZk0v3gN1wJyPUFDH8WAZtwd7HosbrMXXXZIogZusPVsza9sXTCqNmS8LjIxjyBhfrMpias5Bdy5K9400G2LwPQu5';
  await Stripe.instance.applySettings();

  /// Local DB + GetStorage
  await DbHelper.initDb();
  await GetStorage.init();

  /// Timezone setup
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Karachi'));

  /// Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// Background service
  await initializeService();

  runApp(const MyApp());
}

/// Configure background service
Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      isForegroundMode: true,
      autoStart: false,
      notificationChannelId: 'car_tracker_channel',
      initialNotificationTitle: 'Car Tracker',
      initialNotificationContent: 'Tracking location in background',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(autoStart: false, onForeground: onStart, onBackground: onIosBackground),
  );
}

/// Background service entry point
@pragma('vm:entry-point')
void onStart(ServiceInstance service) {
  if (service is AndroidServiceInstance) {
    service.on('stopService').listen((event) {
      service.stopSelf();
    });
  }

  Geolocator.getPositionStream(
    locationSettings: const LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 0),
  ).listen((Position position) {
    if (kDebugMode) {
      print("BG Location: ${position.latitude}, ${position.longitude}");
    }
    // TODO: Push to Firestore here if required
  });
}

/// iOS background entry point
@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  return true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().themes, // global theme mode
      home: const FeaturesScreen(),
    );
  }
}
