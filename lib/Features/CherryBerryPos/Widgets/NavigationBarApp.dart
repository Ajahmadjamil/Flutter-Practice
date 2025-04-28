import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/HomeScreen.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.history), label: 'History'),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      // body: _getPage(currentPageIndex), // Render the appropriate page based on the index
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen(); // Open HomeActivity for the Home tab
      case 1:
        return Center(child: Text("History Page")); // Placeholder for History tab
      case 2:
        return Center(child: Text("Profile Page")); // Placeholder for Profile tab
      default:
        return Center(child: Text("Invalid Page")); // Fallback for invalid index
    }
  }
}
