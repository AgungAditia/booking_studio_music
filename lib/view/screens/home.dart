import 'package:booking_studio_music/model/studio.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../view_model/provider/favorite_manager.dart';
import 'booking.dart';
import 'favorite.dart';
// import 'booking_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: widgets[currentIndex],
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
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Agung Aditia',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.white,
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

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                children: [
                  DefaultTabController(
                    length: 4,
                    child: Expanded(
                      child: Column(
                        children: [
                          ButtonsTabBar(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            backgroundColor: const Color(0xFF5B8C5A),
                            unselectedBackgroundColor: Colors.white,
                            labelStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            unselectedLabelStyle: const TextStyle(
                              color: Color(0xFF5B8C5A),
                              fontWeight: FontWeight.bold,
                            ),
                            borderWidth: 1,
                            unselectedBorderColor: const Color(0xFF5B8C5A),
                            tabs: const [
                              Tab(text: 'Depok'),
                              Tab(text: 'Jakarta'),
                              Tab(text: 'Bandung'),
                              Tab(text: 'Semarang'),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Depok',
                                            style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF5B8C5A),
                                            ),
                                          ),
                                          const Text('See all'),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Expanded(
                                        child: Consumer<Favorite>(
                                          builder: (context, favoriteStudios,
                                              child) {
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
                                                      Navigator.of(context)
                                                          .push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          BookingScreen(
                                                        studio: Studio
                                                            .studios[index],
                                                      ),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.topRight,
                                                    children: [
                                                      Card(
                                                        elevation: 2,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Image.asset(
                                                              Studio
                                                                  .studios[
                                                                      index]
                                                                  .image,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              child: Text(
                                                                Studio
                                                                    .studios[
                                                                        index]
                                                                    .name,
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                child: Text(
                                                                  Studio
                                                                      .studios[
                                                                          index]
                                                                      .address,
                                                                  style:
                                                                      GoogleFonts
                                                                          .roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          favoriteStudios
                                                              .toggleFavorite(
                                                                  index);
                                                          Navigator.of(context)
                                                              .push(
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const FavoriteScreen(),
                                                            ),
                                                          );
                                                        },
                                                        icon: Icon(
                                                          favoriteStudios
                                                                  .isFavorite(
                                                                      index)
                                                              ? Icons.favorite
                                                              : Icons
                                                                  .favorite_border,
                                                          color: favoriteStudios
                                                                  .isFavorite(
                                                                      index)
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Jakarta',
                                            style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF5B8C5A),
                                            ),
                                          ),
                                          const Text('See all'),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Expanded(
                                        child: Consumer<Favorite>(
                                          builder: (context, favoriteStudios,
                                              child) {
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
                                                      Navigator.of(context)
                                                          .push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          BookingScreen(
                                                        studio: Studio
                                                            .studios[index],
                                                      ),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.topRight,
                                                    children: [
                                                      Card(
                                                        elevation: 2,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Image.asset(
                                                              Studio
                                                                  .studios[
                                                                      index]
                                                                  .image,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              child: Text(
                                                                Studio
                                                                    .studios[
                                                                        index]
                                                                    .name,
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                child: Text(
                                                                  Studio
                                                                      .studios[
                                                                          index]
                                                                      .address,
                                                                  style:
                                                                      GoogleFonts
                                                                          .roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          favoriteStudios
                                                              .toggleFavorite(
                                                                  index);
                                                        },
                                                        icon: Icon(
                                                          favoriteStudios
                                                                  .isFavorite(
                                                                      index)
                                                              ? Icons.favorite
                                                              : Icons
                                                                  .favorite_border,
                                                          color: favoriteStudios
                                                                  .isFavorite(
                                                                      index)
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Bandung',
                                            style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF5B8C5A),
                                            ),
                                          ),
                                          const Text('See all'),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Expanded(
                                        child: Consumer<Favorite>(
                                          builder: (context, favoriteStudios,
                                              child) {
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
                                                      Navigator.of(context)
                                                          .push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          BookingScreen(
                                                        studio: Studio
                                                            .studios[index],
                                                      ),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.topRight,
                                                    children: [
                                                      Card(
                                                        elevation: 2,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Image.asset(
                                                              Studio
                                                                  .studios[
                                                                      index]
                                                                  .image,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              child: Text(
                                                                Studio
                                                                    .studios[
                                                                        index]
                                                                    .name,
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                child: Text(
                                                                  Studio
                                                                      .studios[
                                                                          index]
                                                                      .address,
                                                                  style:
                                                                      GoogleFonts
                                                                          .roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          favoriteStudios
                                                              .toggleFavorite(
                                                                  index);
                                                        },
                                                        icon: Icon(
                                                          favoriteStudios
                                                                  .isFavorite(
                                                                      index)
                                                              ? Icons.favorite
                                                              : Icons
                                                                  .favorite_border,
                                                          color: favoriteStudios
                                                                  .isFavorite(
                                                                      index)
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Semarang',
                                            style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF5B8C5A),
                                            ),
                                          ),
                                          const Text('See all'),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Expanded(
                                        child: Consumer<Favorite>(
                                          builder: (context, favoriteStudios,
                                              child) {
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
                                                      Navigator.of(context)
                                                          .push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          BookingScreen(
                                                        studio: Studio
                                                            .studios[index],
                                                      ),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.topRight,
                                                    children: [
                                                      Card(
                                                        elevation: 2,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Image.asset(
                                                              Studio
                                                                  .studios[
                                                                      index]
                                                                  .image,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              child: Text(
                                                                Studio
                                                                    .studios[
                                                                        index]
                                                                    .name,
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                child: Text(
                                                                  Studio
                                                                      .studios[
                                                                          index]
                                                                      .address,
                                                                  style:
                                                                      GoogleFonts
                                                                          .roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          favoriteStudios
                                                              .toggleFavorite(
                                                                  index);
                                                        },
                                                        icon: Icon(
                                                          favoriteStudios
                                                                  .isFavorite(
                                                                      index)
                                                              ? Icons.favorite
                                                              : Icons
                                                                  .favorite_border,
                                                          color: favoriteStudios
                                                                  .isFavorite(
                                                                      index)
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
