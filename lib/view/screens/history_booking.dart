import 'package:booking_studio_music/view/widget/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
        title: Text(
          'History Booking',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BottomPage(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF5B8C5A),
      ),
      body: ListView.builder(
        itemCount: widget.bookings.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage(widget.bookings[index]['image']),
                  ),
                  title: Text(widget.bookings[index]['studio']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.bookings[index]['date']),
                      Text(widget.bookings[index]['time']),
                    ],
                  ),
                  trailing: Text(widget.bookings[index]['price']),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
