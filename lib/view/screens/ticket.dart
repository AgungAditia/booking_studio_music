import 'package:booking_studio_music/view/screens/history_booking.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5FFE9),
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF096314).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            width: 312,
            height: 500,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Image.asset('assets/icons/succes.png'),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                          Text(
                            'Agung Aditia',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                          Text(
                            'agungaditia62@gmail.com',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Number',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                          Text(
                            '089612750032',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Studio',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                          Text(
                            'Straling Music Studio',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                          Text(
                            'Wednesday, 24 April 2023',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Time',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                          Text(
                            '14:00 - 15:00',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                          Text(
                            'Rp. 50.000 - per jam',
                            style: GoogleFonts.roboto(
                              color: const Color(0xFF272727),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HistoryBooking(),
                          ),
                        );
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0xFF5B8C5A),
                        ),
                        fixedSize: MaterialStatePropertyAll(
                          Size(270, 47),
                        ),
                      ),
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
