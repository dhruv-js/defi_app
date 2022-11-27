import 'package:defi_app/res/colors.dart';
import 'package:defi_app/view/widget/card_list_view_builder.dart';
import 'package:defi_app/view/widget/gradient_background.dart';
import 'package:flutter/material.dart';

import '../widget/activity_card.dart';
import '../widget/circular_icon.dart';

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
            heightRatio: 0.21,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 80.0, bottom: 16.0),
                  child: Text(
                    'Recent Activity',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: iconColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  child: CardListViewBuilder(widgets: [
                    ActivityCard(
                      amount: 100,
                      userIcon: const CircularIcon(
                        bgColor: Colors.blueGrey,
                        icon: Icon(
                          Icons.person,
                          color: iconColor,
                        ),
                      ),
                      userName: 'Alaukik Vadhel',
                    ),
                    ActivityCard(
                      amount: 200,
                      userIcon: const CircularIcon(
                        bgColor: Colors.blueGrey,
                        icon: Icon(
                          Icons.person,
                          color: iconColor,
                        ),
                      ),
                      userName: 'Om',
                    ),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
