import 'package:flutter/material.dart';
import '../widgets/botton_navigation.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Notification'),
      ),
      body: Center(
        child: Text('No notifications'),
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 2),
    );
  }
}
