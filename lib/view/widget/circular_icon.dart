import 'package:flutter/material.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({super.key, required this.icon, this.bgColor});
  final Icon icon;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 1, color: Colors.white)),
        child: icon);
  }
}
