import 'package:defi_app/res/colors.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const GradientButton({super.key, required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
          onTap: () => callback,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 54.0,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [Color(0xff5C3D65), Color(0xffBFA1BA)])),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: iconColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )),
    );
  }
}
