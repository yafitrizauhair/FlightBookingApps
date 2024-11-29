import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/my_ticket_page.dart';
import 'pages/login_page.dart'; // Import the LoginPage
import 'pages/register_page.dart'; // Import the RegisterPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login', // Set the initial route to LoginPage
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/my-tickets': (context) => MyTicketPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
