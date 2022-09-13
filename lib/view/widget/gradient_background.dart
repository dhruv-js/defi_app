import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final double heightRatio;

  const GradientContainer({super.key, required this.heightRatio});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * heightRatio,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xffBFA1BA), Color(0xff5C3D65)])),
    );
  }
}
