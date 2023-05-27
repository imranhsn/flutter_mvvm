import 'package:mvvm_test/view/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';

import '../res/style/TextStyles.dart';
import 'booking/BookingScreen.dart';
import 'home/HomeScreen.dart';
import 'notification/NotificationScreen.dart';

class MainScreen extends StatefulWidget {
  static final String id = "main_screen";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 2; // set notification screen as a default
  final _titles = ["Home", "Booking", "Notification", "Profile"];
  final _pageOptions = [
    HomeScreen(),
    BookingScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(_titles[_selectedIndex], style: TextStyles.appTitle),
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_sharp),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: '',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
