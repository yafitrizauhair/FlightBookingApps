import 'package:flutter/material.dart';
import '../widgets/botton_navigation.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Profile Page'),
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 3),
    );
  }
}
