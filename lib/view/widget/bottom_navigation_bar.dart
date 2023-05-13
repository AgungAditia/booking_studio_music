import 'package:booking_studio_music/view/screens/favorite.dart';
import 'package:flutter/material.dart';

import '../../view/screens/history_booking.dart';
import '../../view/screens/home.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _MyAppState();
}

class _MyAppState extends State<BottomPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    HistoryBooking(
      bookings: const [],
    ),
    const FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF5B8C5A),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
