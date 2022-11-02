import 'package:defi_app/res/colors.dart';
import 'package:defi_app/view/widget/circular_icon.dart';
import 'package:defi_app/view/widget/friends_card.dart';
import 'package:defi_app/view/widget/gradient_background.dart';
import 'package:defi_app/view/widget/profile_card.dart';
import 'package:flutter/material.dart';

import '../widget/search_box.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const GradientContainer(
                heightRatio: 0.43,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 64.0, bottom: 8.0),
                      child: SearchBox(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Account',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: iconColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Settings',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: iconColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    ProfileCard(
                      userName: 'Devansh Shah',
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FriendsCard(
                userIcon: const Icon(
                  Icons.qr_code,
                  color: Colors.white,
                ),
                string: 'Scan Code',
                callback: () {}),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text('Preferences',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FriendsCard(string: 'Passcode', callback: () {}),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Text('Feedback',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FriendsCard(string: 'Rate Defi', callback: () {}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FriendsCard(string: 'Contact Us', callback: () {}),
          ),
        ],
      ),
    );
  }
}
