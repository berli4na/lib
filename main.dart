import 'package:flutter/material.dart';
import 'package:transaksi/appointment.dart';
import 'package:transaksi/home.dart';
import 'package:transaksi/records.dart';
import 'package:transaksi/transactions.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaksi',
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int index = 0;

  final screens = [
    home(),
    appointment(),
    record(),
    transactionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index], // Show the current page based on index
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          selectedIndex: index, // Set the selected index based on state
          onDestinationSelected: (int index) => setState(() => this.index = index), // Update index on tap
          destinations: [
            NavigationDestination(icon: Icon(Icons.home, color: Colors.black), label: 'Home'),
            NavigationDestination(
              icon: Icon(Icons.shopping_bag, color: Colors.black),
              label: 'Appointment',
            ),
            NavigationDestination(icon: Icon(Icons.receipt, color: Colors.black), label: 'Records'),
            NavigationDestination(
              icon: Icon(Icons.payment, color: Colors.black),
              label: 'Transactions',
            ),
          ],
        ),
      ),
    );
  }
}
