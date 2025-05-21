import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifiedPage extends StatelessWidget {
  final String label;

  const NotifiedPage({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Get.isDarkMode;
    final String notificationText = label.toString().split("|")[0];

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios,
              color: isDarkMode ? Colors.white : Colors.grey[800]),
        ),
        title: Text(
          "Notification Details",
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.grey[800],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Header with time and icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.notifications_active,
                        color: isDarkMode ? Colors.amber : Colors.deepPurple),
                    const SizedBox(width: 10),
                    Text(
                      "Now",
                      style: TextStyle(
                        color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? Colors.deepPurple[800]
                        : Colors.deepPurple[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "New",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.deepPurple,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Notification card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isDarkMode ? Colors.grey[800] : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    "Important Notification",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Divider
                  Divider(
                    color: isDarkMode ? Colors.grey[700] : Colors.grey[200],
                    thickness: 1,
                  ),
                  const SizedBox(height: 15),

                  // Notification content
                  Text(
                    notificationText,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor:
                              isDarkMode ? Colors.grey[400] : Colors.grey[600],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Dismiss"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDarkMode
                    ? Colors.grey[800]
                    : Colors.deepPurple.withOpacity(0.1),
              ),
              child: Icon(
                Icons.notifications_none,
                size: 30,
                color: isDarkMode ? Colors.amber : Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
