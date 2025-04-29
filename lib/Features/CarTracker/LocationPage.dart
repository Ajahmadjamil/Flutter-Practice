import 'dart:async';
import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:background_location/background_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterpractices/Features/CarTracker/SharedPref.dart';
import 'package:flutterpractices/FeaturesScreen.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  final DocumentReference documentRef;

  const LocationPage({super.key, required this.documentRef});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Position? _currentPosition;
  bool _isLoading = true;
  bool _isTracking = true;
  StreamSubscription<Position>? _positionStream;
  final bool _isBackPressed = false;
  int _batteryLevel = 0;
  final Battery _battery = Battery();
  StreamSubscription? _batterySubscription;
  @override
  void initState() {
    super.initState();
    _initLocationService();
    _initBatteryMonitoring();
  }

  void _initBatteryMonitoring() async {
    _batteryLevel = await _battery.batteryLevel;
    if (mounted) setState(() {});

    _batterySubscription = _battery.onBatteryStateChanged.listen((state) async {
      final newLevel = await _battery.batteryLevel;
      if (mounted && newLevel != _batteryLevel) {
        setState(() {
          _batteryLevel = newLevel;
        });
      }
    });

    Timer.periodic(const Duration(seconds: 30), (timer) async {
      if (!mounted) {
        timer.cancel();
        return;
      }
      final newLevel = await _battery.batteryLevel;
      if (mounted && newLevel != _batteryLevel) {
        setState(() {
          _batteryLevel = newLevel;
        });
      }
    });
  }
  @override
  void dispose() {
    _positionStream?.cancel();
    _batterySubscription?.cancel();
    BackgroundLocation.stopLocationService();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Custom AppBar Row with logout button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Location Tracking",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.logout, color: Colors.white),
                        onPressed: _isLoading ? null : _showLogoutConfirmation,
                      ),

                    ],
                  ),
                ),

                Expanded(
                  child: Center(
                    child: _isLoading
                        ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text(
                          "Initializing location tracking...",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                        : _currentPosition == null
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Location not available",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _initLocationService,
                          child: const Text('Retry'),
                        ),
                      ],
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Battery : $_batteryLevel%", // Battery indicator
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 16),

                        const Text(
                          "Current Location:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Latitude: ${_currentPosition!.latitude.toStringAsFixed(6)}",
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "Longitude: ${_currentPosition!.longitude.toStringAsFixed(6)}",
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _initLocationService() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _isLoading = false;
        });
        _showLocationServiceDisabledAlert();
        return;
      }

      // Check and request permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _isLoading = false;
          });
          _showPermissionDeniedAlert();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _isLoading = false;
        });
        _showPermissionPermanentlyDeniedAlert();
        return;
      }

      // Start background location service
      await BackgroundLocation.startLocationService(
        distanceFilter: 0,
        // androidNotificationTitle: 'Location Tracking',
        // androidNotificationMessage: 'Tracking your location in background',


      );

      BackgroundLocation.getLocationUpdates((location) async {
        if (mounted) {
          setState(() {
            _currentPosition = location as Position?;
            _isLoading = false;
          });
        }

        await _updateLocationInFirestore(
          location.latitude,
          location.longitude,
        );
      });

      // Get initial position
      _currentPosition = await Geolocator.getCurrentPosition();
      await _updateLocationInFirestore(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }

      // Optional: Listen for foreground location updates too
      _positionStream = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.bestForNavigation,
          distanceFilter: 0,
        ),
      ).listen((Position position) {
        if (mounted) {
          setState(() {
            _currentPosition = position;
          });
        }
        _updateLocationInFirestore(position.latitude, position.longitude);
      });

    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
      debugPrint('Location service error: $e');
    }
  }

  Future<void> _updateLocationInFirestore(double? latitude, double? longitude) async {
    try {
      await widget.documentRef.set({
        'latitude': latitude,
        'longitude': longitude,
        'timestamp': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Firestore update error: $e');
    }
  }

  void _showLocationServiceDisabledAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Service Disabled'),
        content: const Text('Please enable location services to continue tracking.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showPermissionDeniedAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Permission Denied'),
        content: const Text('Location permissions are required for tracking.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showPermissionPermanentlyDeniedAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Permission Required'),
        content: const Text('Location permissions are permanently denied. Please enable them in app settings.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () async {
              await Geolocator.openAppSettings();
              Navigator.pop(context);
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  Future<void> _toggleTracking() async {
    setState(() {
      _isTracking = !_isTracking;
      _isLoading = true;
    });

    if (_isTracking) {
      await _initLocationService();
    } else {
      await BackgroundLocation.stopLocationService();
      _positionStream?.cancel();
      setState(() {
        _isLoading = false;
      });
    }
  }


  void _delDriver() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.documentRef.delete();

      SharedPref sp = SharedPref();
      await sp.clearDriverInfo();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Driver info deleted successfully')),
        );
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) =>const  FeaturesScreen()));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting driver info: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure you want to change the Driver?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _delDriver(); // Execute the delete function
              },
            ),
          ],
        );
      },
    );
  }
  Future<bool> _onWillPop() async {
    if (_isBackPressed) return true;

    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App?'),
        content: const Text('Do you want to exit the application?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    ) ?? false;

    return shouldExit;
  }
}






