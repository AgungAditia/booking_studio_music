import 'package:flutter/material.dart';

class FormBooking extends StatelessWidget {
  FormBooking({
    required this.labelName,
    required this.hintName,
    required this.controller,
    super.key,
  });

  String labelName;
  String hintName;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelName,
        hintText: hintName,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value != null && value.length < 4) {
          return 'Enter at least 4 characters';
        } else {
          return null;
        }
      },
    );
  }
}
