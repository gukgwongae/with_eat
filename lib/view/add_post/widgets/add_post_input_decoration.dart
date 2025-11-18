import 'package:flutter/material.dart';

InputDecoration styleInputDecoration({String? hintText}) {
  return InputDecoration(
    hintText: hintText,
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1.3),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.black, width: 1.5),
    ),
  );
}
