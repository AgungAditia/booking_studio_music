import 'package:booking_studio_music/view/screens/history_booking.dart';
import 'package:booking_studio_music/view/screens/home.dart';
import 'package:booking_studio_music/view_model/provider/favorite_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Favorite(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(
            primary: const Color(0xFF5B8C5A),
          ),
        ),
        debugShowCheckedModeBanner: false,
        // home: const HomeScreen(),
        home: HomeScreen(),
      ),
    );
  }
}
