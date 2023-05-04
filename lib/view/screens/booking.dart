import 'package:booking_studio_music/view/screens/home.dart';
import 'package:booking_studio_music/view/screens/ticket.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../model/studio.dart';
import '../../model/widgets/text_form_field.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    required this.studio,
    super.key,
  });

  final Studio studio;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  late DateTime _selectedDate;
  late DateTime _startBookingTime;
  late DateTime _finishBookingTime;
  bool _showSummary = false;


  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _startBookingTime = DateTime.now();
    _finishBookingTime = DateTime.now().add(
      const Duration(hours: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B8C5A),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Booking',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Hero(
                  tag: widget.studio.image,
                  child: Image.asset(
                    widget.studio.image,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                widget.studio.name,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 5,
                ),
                child: Text(
                  widget.studio.address,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
              top: 20,
            ),
            child: Center(
              child: Text(
                'Select a Date & Time',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    FormBooking(
                      labelName: 'Name',
                      hintName: 'Your name ...',
                      controller: _nameController,
                    ),
                    const SizedBox(height: 10),
                    FormBooking(
                      labelName: 'Number',
                      hintName: 'Your number ...',
                      controller: _numberController,
                    ),
                    const SizedBox(height: 10),
                    FormBooking(
                      labelName: 'Email',
                      hintName: 'Your email ...',
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Open 10:00 - 22:00',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 7),
                              ),
                              helpText: 'Select booking date',
                            );
                            if (selectedDate != null) {
                              setState(() {
                                _selectedDate = selectedDate;
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.calendar_today),
                                  const SizedBox(width: 8),
                                  Text(
                                    DateFormat.yMMMd().format(_selectedDate),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final TimeOfDay? selectedTime =
                                      await showTimePicker(
                                          context: context,
                                          initialTime: const TimeOfDay(
                                              hour: 10, minute: 0),
                                          // lastTime: TimeOfDay(hour: 21, minute: 0),
                                          helpText:
                                              'Select booking start time');
                                  if (selectedTime != null) {
                                    setState(() {
                                      _startBookingTime = DateTime(
                                        _selectedDate.year,
                                        _selectedDate.month,
                                        _selectedDate.day,
                                        selectedTime.hour,
                                        selectedTime.minute,
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(Icons.access_time),
                                        const SizedBox(width: 8),
                                        Text(
                                          DateFormat.jm()
                                              .format(_startBookingTime),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final TimeOfDay? selectedTime =
                                      await showTimePicker(
                                          context: context,
                                          initialTime: const TimeOfDay(
                                              hour: 11, minute: 0),
                                          // lastTime: TimeOfDay(hour: 22, minute: 0),
                                          helpText:
                                              'Select booking finish time');
                                  if (selectedTime != null) {
                                    setState(() {
                                      _finishBookingTime = DateTime(
                                        _selectedDate.year,
                                        _selectedDate.month,
                                        _selectedDate.day,
                                        selectedTime.hour,
                                        selectedTime.minute,
                                      );
                                    });
                                  }
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(Icons.access_time),
                                        const SizedBox(width: 8),
                                        Text(
                                          DateFormat.jm()
                                              .format(_finishBookingTime),
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _showSummary = true;
                              });
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Color(0xFF5B8C5A),
                              ),
                            ),
                            child: const Text('Book Now'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Colors.black,
                        ),
                        if (_showSummary) ...[
                          Text(
                            'Booking Summary',
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date: ${DateFormat.yMMMd().format(_selectedDate)}',
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Time: ${DateFormat.jm().format(_startBookingTime)} - '
                                    '${DateFormat.jm().format(_finishBookingTime)}',
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Price per hour: Rp. 50,000',
                                style: GoogleFonts.roboto(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const TicketScreen(),
                                  ),
                                );
                              },
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Color(0xFF5B8C5A),
                                ),
                                fixedSize: MaterialStatePropertyAll(
                                  Size(312, 47),
                                ),
                              ),
                              child: const Text('Select Payment'),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
