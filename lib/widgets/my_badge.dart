import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  const MyBadge({
    required this.text,
    required this.size,
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  });

  final String text;
  final double size;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(size / 2)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: foregroundColor, fontSize: size / 1.8),
        ),
      ),
    );
  }
}
