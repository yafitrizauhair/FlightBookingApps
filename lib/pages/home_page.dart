import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/db_helper.dart';
import '../widgets/botton_navigation.dart';
import 'search_result_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> flights = [];
  String fromCity = 'Manado, MDC';
  String toCity = 'Jakarta, CGK';
  String travelClass = 'Economy';
  int passengers = 1;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadFlights();
  }

  void _loadFlights() async {
    flights = await DBHelper().getFlights();
    setState(() {});
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _searchFlights() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultPage(
          fromCity: fromCity,
          toCity: toCity,
          travelClass: travelClass,
          passengers: passengers,
          selectedDate: selectedDate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hallo Selamat Datang!!!!',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Mau Kemana Nich?'),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.mail),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.flight_takeoff, size: 30),
                                SizedBox(height: 5),
                                Text('One-Way'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.blue),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.flight_land, size: 30),
                                SizedBox(height: 5),
                                Text('Round-Trip'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.blue),
                              SizedBox(width: 9),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: fromCity,
                                  isExpanded: true,
                                  items: <String>[
                                    'Manado, MDC',
                                    'Jakarta, CGK',
                                    'Bali, DPS',
                                    'Surabaya, SUB'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      fromCity = newValue!;
                                    });
                                  },
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.swap_vert, color: Colors.blue),
                                onPressed: () {
                                  setState(() {
                                    String temp = fromCity;
                                    fromCity = toCity;
                                    toCity = temp;
                                  });
                                },
                              ),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: toCity,
                                  isExpanded: true,
                                  items: <String>[
                                    'Jakarta, CGK',
                                    'Manado, MDC',
                                    'Bali, DPS',
                                    'Surabaya, SUB'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      toCity = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.blue),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, color: Colors.blue),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () => _selectDate(context),
                                child: Text(
                                  DateFormat('EEE, d MMM yyyy')
                                      .format(selectedDate),
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.blue),
                          Row(
                            children: [
                              Icon(Icons.person, color: Colors.blue),
                              SizedBox(width: 10),
                              Expanded(
                                child: DropdownButton<int>(
                                  value: passengers,
                                  isExpanded: true,
                                  items: List<int>.generate(10, (i) => i + 1)
                                      .map((int value) {
                                    return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text('$value Passenger(s)'),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      passengers = newValue!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: travelClass,
                                  isExpanded: true,
                                  items: <String>[
                                    'Economy',
                                    'Business',
                                    'First Class'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      travelClass = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _searchFlights,
                      child: Text('Search Flight'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Recent Activity'),
              flights.isEmpty
                  ? Text('No recent activity')
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: flights.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              '${flights[index]['from_city']} to ${flights[index]['to_city']}'),
                          subtitle: Text(
                              '${flights[index]['date']} - ${flights[index]['passengers']} Passenger(s)'),
                        );
                      },
                    ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text('View All'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 0),
    );
  }
}
