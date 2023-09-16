import 'package:flutter/material.dart';

var myColor = Colors.grey;
var myAppBarColor = Colors.white;
var myTextColor = Colors.black;
var myOtherTextColor = Colors.grey[900];

var myTextStyle = const TextStyle(
    color: Colors.black, fontWeight: FontWeight.w500, letterSpacing: 0.5);

var myTextButtonStyle = const TextStyle(
    color: Color.fromARGB(255, 88, 135, 255),
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5);

var elevatedButtonTextStyle = const TextStyle(
  color: Colors.white,
  fontSize: 18,
);


class CustomSnackbar {
  static void show({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
