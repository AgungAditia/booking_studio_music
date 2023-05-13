import 'package:booking_studio_music/model/studio.dart';
import 'package:booking_studio_music/view_model/provider/favorite_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Studio Favorite',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<Favorite>(
        builder: (context, favoriteStudios, child) {
          final favoriteList = Studio.studios
              .where(
                (studio) => favoriteStudios.isFavorite(
                  Studio.studios.indexOf(studio),
                ),
              )
              .toList();

          return ListView.builder(
            itemCount: favoriteList.length,
            itemBuilder: (context, index) {
              final studio = favoriteList[index];

              return Card(
                child: ListTile(
                  leading: Image.asset(studio.image),
                  title: Text(studio.name),
                  subtitle: Text(studio.address),
                  trailing: IconButton(
                    onPressed: () {
                      favoriteStudios
                          .toggleFavorite(Studio.studios.indexOf(studio));
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
