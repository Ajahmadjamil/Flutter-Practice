import 'package:flutterpractices/Features/CarTracker/SharedPref.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'LocationPage.dart';


class VehicleFormScreen extends StatefulWidget {
  const VehicleFormScreen({super.key});

  @override
  State<VehicleFormScreen> createState() => _VehicleFormScreenState();
}

class _VehicleFormScreenState extends State<VehicleFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _permissionGranted = false;

  final _nameController = TextEditingController();
  final _regNoController = TextEditingController();

  int _selectedVehicleIndex = 0; // default to "Car"
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final List<String> _vehicleList = ['Car', 'SUV', 'Mini-Van', 'Van', 'Truck'];

  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    final status = await Permission.notification.request();

    if (status.isGranted) {
      setState(() {
        _permissionGranted = true;
      });

    } else {
      setState(() {
        _permissionGranted = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _regNoController.dispose();
    super.dispose();
  }

  Future<bool> _checkRegNo(String regisNo) async {
    final result = await _db
        .collection('locations')
        .where('registrationNo', isEqualTo: regisNo)
        .limit(1)
        .get();

    return result.docs.isEmpty;
  }

  Future<void> _saveForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final isUnique = await _checkRegNo(_regNoController.text);

      if (!isUnique) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('This Registration number Already Exist')),
        );
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final newDoc = _db.collection('locations').doc();

      await newDoc.set({
        'name': _nameController.text,
        'registrationNo': _regNoController.text,
        'vehicleType': _selectedVehicleIndex, // Store index
      });

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LocationPage(documentRef: newDoc)),
      );

      SharedPref sharedPref = SharedPref();
      sharedPref.setDriverInfo(
        _regNoController.text,
        _nameController.text,
        newDoc.path,
      );

      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Center(
              child: Text(
                'Enter Driver Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _regNoController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Registration Number',
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Registration Number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<int>(
                        value: _selectedVehicleIndex,
                        dropdownColor: Colors.black87,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Vehicle Type',
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        items: List.generate(_vehicleList.length, (index) {
                          return DropdownMenuItem<int>(
                            value: index,
                            child: Text(
                              _vehicleList[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                        onChanged: (newIndex) {
                          setState(() {
                            _selectedVehicleIndex = newIndex!;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select vehicle type';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _isLoading ? null : _saveForm,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Save Details'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
