// import 'package:booking_studio_music/view/screens/home.dart';
// import 'package:booking_studio_music/view/screens/ticket.dart';
// import 'package:flutter/material.dart';

// import '../../view/screens/booking.dart';

// class MyBottomNavigationBar extends StatefulWidget {
//   const MyBottomNavigationBar({Key? key}) : super(key: key);

//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   int _selectedIndex = 0;

//   final List _widgetOptions = const [
//     HomeScreen(),
//     BookingScreen(),
//     TicketScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Booking',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.confirmation_number),
//             label: 'Ticket',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
