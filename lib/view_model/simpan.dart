import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/studio.dart';

class ButtonCity extends StatefulWidget {
  const ButtonCity({
    Key? key,
    required this.text,
    required this.studios,
  }) : super(key: key);

  final String text;
  final List<Studio> studios;

  @override
  State<ButtonCity> createState() => _ButtonCityState();
}

class _ButtonCityState extends State<ButtonCity> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(widget.studios.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                width: (MediaQuery.of(context).size.width - 30) / 2,
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? const Color(0xFFEFEFEF)
                      : const Color(0xFF5B8C5A),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: selectedIndex == index
                        ? const Color(0xFF5B8C5A)
                        : Colors.transparent,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      widget.studios[index].image,
                      fit: BoxFit.cover,
                      height: 120,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        widget.studios[index].name,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        if (selectedIndex != -1)
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  widget.studios[selectedIndex].image,
                  fit: BoxFit.cover,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.studios[selectedIndex].name,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    widget.studios[selectedIndex].address,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
