import 'package:booking_studio_music/model/studio.dart';
import 'package:booking_studio_music/view/screens/booking.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../model/style/color.dart';
import '../../model/widgets/bottom_nav_bar.dart';
import '../../model/widgets/button.dart';
import '../../view_model/provider/favorite_manager.dart';
import 'booking_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Profile Start
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 400,
                height: 250,
                color: Colors.grey[200],
                child: Image.asset(
                  'assets/images/app_bar.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/avatar.png'),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning',
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                color: whiteColor,
                              ),
                            ),
                            Text(
                              'Agung Aditia',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Image.asset(
                      'assets/icons/notification.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
          //  Profile End

          // Button City Start
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ButtonCity(text: 'Depok'),
                ButtonCity(text: 'Jakarta'),
                ButtonCity(text: 'Bandung'),
                ButtonCity(text: 'Semarang'),
              ],
            ),
          ),
          // Button City End

          // Studio Start
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Color(0xFF5B8C5A),
                  ),
                ),
              ],
            ),
          ),
          // Studio End

          // Content Studio Booking Start
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<Favorite>(
                builder: (context, favoriteStudios, child) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: Studio.studios.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BookingScreen(),
                        )),
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Card(
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Image.asset(
                                    Studio.studios[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      Studio.studios[index].name,
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        Studio.studios[index].address,
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                favoriteStudios.toggleFavorite(index);
                              },
                              icon: Icon(
                                favoriteStudios.isFavorite(index)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: favoriteStudios.isFavorite(index)
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          // Content Studio Booking End
        ],
      ),
    );
  }
}
