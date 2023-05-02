import 'package:booking_studio_music/view/screens/booking.dart';
import 'package:booking_studio_music/view/screens/home.dart';
import 'package:booking_studio_music/view_model/provider/favorite_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/widgets/bottom_nav_bar.dart';
import 'view/screens/booking_page.dart';

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
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
