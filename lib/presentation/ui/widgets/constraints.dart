import 'package:flutter/material.dart';

var myTextStyle = const TextStyle(
    color: Colors.black, fontWeight: FontWeight.w500, letterSpacing: 0.5);
var myTextColor = Colors.black;
var myOtherTextColor = Colors.grey[900];

var myTextButtonStyle = const TextStyle(
    color: Color.fromARGB(255, 88, 135, 255),
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5);

var myButtonTextColor = const TextStyle(color: Colors.white);

var myColor =  Colors.grey;

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String tittle;
  const BasicAppBar({
    super.key,
    required this.tittle,
    TextStyle? style,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65,
      title: Text(tittle),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

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


