import 'package:booking_studio_music/view/screens/home.dart';
import 'package:flutter/material.dart';

class HistoryBooking extends StatelessWidget {
  const HistoryBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('History Booking'),
        centerTitle: true,
        backgroundColor: const Color(0xFF5B8C5A),
      ),
    );
  }
}
