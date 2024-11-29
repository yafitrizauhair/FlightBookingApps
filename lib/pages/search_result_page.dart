import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/db_helper.dart';
import 'my_ticket_page.dart';

class SearchResultPage extends StatelessWidget {
  final String fromCity;
  final String toCity;
  final String travelClass;
  final int passengers;
  final DateTime selectedDate;

  final List<String> airlines = [
    'Garuda Indonesia',
    'Singapore Airlines',
    'Emirates',
    'Qatar Airways',
    'Cathay Pacific',
    'Turkish Airlines',
    'Qantas',
    'Lufthansa',
    'ANA (All Nippon Airways)',
    'British Airways',
    'Etihad Airways',
  ];

  SearchResultPage({
    required this.fromCity,
    required this.toCity,
    required this.travelClass,
    required this.passengers,
    required this.selectedDate,
  });

  Future<void> _bookFlight(
      BuildContext context, String airline, int price) async {
    Map<String, dynamic> flight = {
      'from_city': fromCity,
      'to_city': toCity,
      'date': selectedDate.toIso8601String(),
      'passengers': passengers,
      'class': travelClass,
      'airline': airline,
      'price': price,
    };

    await DBHelper().insertFlight(flight);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyTicketPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Flights from $fromCity to $toCity on ${DateFormat('EEE, d MMM yyyy').format(selectedDate)} for $passengers passenger(s) in $travelClass class',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: airlines.length,
                itemBuilder: (context, index) {
                  int price = (index + 1) * 100;
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.flight),
                      title: Text(airlines[index]),
                      subtitle: Text('Flight from $fromCity to $toCity'),
                      trailing: Text('Price: \$${price}'),
                      onTap: () => _bookFlight(context, airlines[index], price),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
