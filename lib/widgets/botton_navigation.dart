import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/my_ticket_page.dart';
import '../pages/notification_page.dart';
import '../pages/profile_page.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;

  BottomNavigation({required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = MyTicketPage();
        break;
      case 2:
        page = NotificationPage();
        break;
      case 3:
        page = ProfilePage();
        break;
      default:
        page = HomePage();
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplane_ticket),
          label: 'My Ticket',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
