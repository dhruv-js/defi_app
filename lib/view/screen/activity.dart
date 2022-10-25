import 'package:defi_app/res/colors.dart';
import 'package:defi_app/view/widget/card_list_view_builder.dart';
import 'package:defi_app/view/widget/friends_card.dart';
import 'package:defi_app/view/widget/gradient_background.dart';
import 'package:defi_app/view/widget/total_balance_card.dart';
import 'package:flutter/material.dart';

import '../widget/activity_card.dart';
import '../widget/search_box.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: Stack(
        children: [
          const GradientContainer(
            heightRatio: 0.43,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 64.0, bottom: 8.0),
                  child: SearchBox(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Recent Activity',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: iconColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                CardListViewBuilder(widgets: [
                  ActivityCard(
                      amount: 500,
                      userIcon: const Icon(
                        Icons.person,
                        color: iconColor,
                      ),
                      userName: 'Devansh Shah',
                      callback: () {}),
                  FriendsCard(
                      amount: -500,
                      userIcon: const Icon(
                        Icons.person,
                        color: iconColor,
                      ),
                      userName: 'Devansh Shah',
                      callback: () {}),
                  FriendsCard(
                      amount: 1000,
                      userIcon: const Icon(
                        Icons.person,
                        color: iconColor,
                      ),
                      userName: 'Devansh Shah',
                      callback: () {}),
                  FriendsCard(
                      amount: 100,
                      userIcon: const Icon(
                        Icons.person,
                        color: iconColor,
                      ),
                      userName: 'Devansh Shah',
                      callback: () {}),
                  FriendsCard(
                      amount: 200,
                      userIcon: const Icon(
                        Icons.person,
                        color: iconColor,
                      ),
                      userName: 'Devansh Shah',
                      callback: () {}),
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}