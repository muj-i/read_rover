import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const AppBarIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 36,
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(60),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
          
            color: Colors.grey[600],
            size: 26,
          ),
        ),
      ),
    );
  }
}