import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:booking_studio_music/view/screens/home.dart';

class HistoryBooking extends StatefulWidget {
  HistoryBooking({
    Key? key,
    required this.bookings,
  }) : super(key: key);
  List<Map<String, dynamic>> bookings = [];

  @override
  State<HistoryBooking> createState() => _HistoryBookingState();
}

class _HistoryBookingState extends State<HistoryBooking> {
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
      body: ListView.builder(
        itemCount: widget.bookings.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.bookings[index]['studio']),
            subtitle: Text(widget.bookings[index]['date'] +
                ' ' +
                widget.bookings[index]['time']),
            trailing: Text(widget.bookings[index]['price']),
          );
        },
      ),
    );
  }
}
