import 'package:flutter/material.dart';

class ButtonCity extends StatefulWidget {
  const ButtonCity({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<ButtonCity> createState() => _ButtonCityState();
}

class _ButtonCityState extends State<ButtonCity> {
  @override
  Widget build(BuildContext context) {
    bool isActive = false;

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          isActive ? Color(0xFFEFEFEF) : Color(0xFF5B8C5A),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isActive ? const Color(0xFF5B8C5A) : Colors.transparent,
            ),
          ),
        ),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            color: isActive ? Color(0xFF5B8C5A) : Colors.white,
          ),
        ),
      ),
      onPressed: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: Text(widget.text),
    );
  }
}
