import 'dart:convert';

import 'package:booking_studio_music/view/screens/history_booking.dart';
import 'package:booking_studio_music/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/studio.dart';

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
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late DateTime _selectedDate;
  late DateTime _startBookingTime;
  late DateTime _finishBookingTime;
  double _totalPrice = 0.0;
  List<Map<String, dynamic>> bookingData = [];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _startBookingTime = DateTime.now();
    _finishBookingTime = DateTime.now().add(
      const Duration(hours: 1),
    );
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Center(
            child: Image.asset('assets/icons/succes.png'),
          ),
          content: SizedBox(
            height: 320,
            width: 500,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Name',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                      Text(
                        _nameController.text,
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                      Text(
                        _emailController.text,
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Number',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                      Text(
                        _numberController.text,
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Studio',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                      Text(
                        widget.studio.name,
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Number',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                      Text(
                        _numberController.text,
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(_selectedDate),
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Time',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                      Text(
                        '${DateFormat.jm().format(_startBookingTime)} - '
                        '${DateFormat.jm().format(_finishBookingTime)}',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'price',
                        style: GoogleFonts.roboto(
                          color: const Color(0xFF272727),
                        ),
                      ),
                      if (_totalPrice > 0)
                        Text(
                          'Rp. ${_totalPrice.toStringAsFixed(2)}',
                          style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Map<String, dynamic> bookingMap = {
                  'name': _nameController.text,
                  'email': _emailController.text,
                  'number': _numberController.text,
                  'studio': widget.studio.name,
                  'date': DateFormat.yMMMd().format(_selectedDate),
                  'time':
                      '${DateFormat.jm().format(_startBookingTime)} - ${DateFormat.jm().format(_finishBookingTime)}',
                  'price': 'Rp. ${_totalPrice.toStringAsFixed(2)}',
                };

                bookingData.add(bookingMap);

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HistoryBooking(
                      bookings: bookingData,
                    ),
                  ),
                );
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    super.dispose();
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 20,
                            bottom: 20,
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
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                  hintText: 'Your name ...',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value != null && value.length < 4) {
                                    return 'Enter at least 4 characters';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'Your email ...',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value != null && value.length < 4) {
                                    return 'Enter at least 4 characters';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: _numberController,
                                decoration: const InputDecoration(
                                  labelText: 'Number',
                                  hintText: 'Your number ...',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value != null && value.length < 4) {
                                    return 'Enter at least 4 characters';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 20,
                            left: 20,
                            top: 20,
                          ),
                          child: Text(
                            'Open 10:00 - 22:00',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
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
                                            hour: 10,
                                            minute: 0,
                                          ),
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
                                      Duration duration = _finishBookingTime
                                          .difference(_startBookingTime);
                                      double totalHours =
                                          duration.inMinutes / 60.0;
                                      _totalPrice = totalHours * 50000;
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
                              _showAlertDialog();
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Color(0xFF5B8C5A),
                              ),
                              fixedSize: MaterialStatePropertyAll(
                                Size(350, 50),
                              ),
                            ),
                            child: const Text('Booking Now'),
                          ),
                        ),
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
