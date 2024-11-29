import 'package:flutter/material.dart';
import '../services/db_helper.dart';
import '../widgets/botton_navigation.dart';

class MyTicketPage extends StatefulWidget {
  @override
  _MyTicketPageState createState() => _MyTicketPageState();
}

class _MyTicketPageState extends State<MyTicketPage> {
  List<Map<String, dynamic>> tickets = [];

  @override
  void initState() {
    super.initState();
    _loadTickets();
  }

  void _loadTickets() async {
    tickets = await DBHelper().getFlights();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('My Tickets'),
      ),
      body: tickets.isEmpty
          ? Center(child: Text('No tickets available'))
          : ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                      '${tickets[index]['from_city']} to ${tickets[index]['to_city']} with ${tickets[index]['airline']}'),
                  subtitle: Text(
                      '${tickets[index]['date']} - ${tickets[index]['passengers']} Passenger(s) in ${tickets[index]['class']} class\nPrice: \$${tickets[index]['price']}'),
                );
              },
            ),
      bottomNavigationBar: BottomNavigation(currentIndex: 1),
    );
  }
}
