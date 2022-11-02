import 'package:defi_app/res/colors.dart';
import 'package:defi_app/view/widget/circular_icon.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: iconColor.withOpacity(0.2),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircularIcon(
                icon: const Icon(
                  Icons.person,
                  color: iconColor,
                  size: 54,
                ),
                bgColor: iconColor.withOpacity(0.2),
              ),
            ),
            Text(
              userName,
              style: const TextStyle(
                color: iconColor,
                fontSize: 24,
              ),
            ),
          ])),
    );
  }
}
