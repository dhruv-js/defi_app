import 'package:defi_app/res/colors.dart';
import 'package:defi_app/utils/constants.dart';
import 'package:defi_app/view/widget/card_list_view_builder.dart';
import 'package:defi_app/view/widget/circular_icon.dart';
import 'package:defi_app/view/widget/friends_card.dart';
import 'package:defi_app/view/widget/gradient_background.dart';
import 'package:defi_app/view/widget/total_balance_card.dart';
import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import '../../model/group.dart';
import '../widget/button.dart';
import 'friends_transactions.dart';

class FriendsScreen extends StatefulWidget {
  final Web3Client ethClient;

  const FriendsScreen({super.key, required this.ethClient});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  TextEditingController friendNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: Stack(
        children: [
          const GradientContainer(
            heightRatio: 0.41,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80.0, bottom: 16.0),
                  child: Row(
                    children: [
                      const Text(
                        'Friends',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: iconColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25.0),
                                ),
                              ),
                              backgroundColor: cardColor,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 32.0, bottom: 16.0),
                                        child: Text(
                                          'Add Friend',
                                          style: TextStyle(
                                              color: iconColor,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: TextField(
                                          style:
                                              const TextStyle(color: iconColor),
                                          decoration: const InputDecoration(
                                            labelStyle:
                                                TextStyle(color: iconColor),
                                            border: OutlineInputBorder(),
                                            labelText: 'Enter Friend\'s Name',
                                          ),
                                          controller: friendNameController,
                                        ),
                                      ),
                                      GradientButton(
                                          text: 'Add Friend',
                                          onPressed: () {
                                            groups.add(Group(
                                                [0, 0],
                                                friendNameController.text,
                                                [
                                                  userName,
                                                  friendNameController.text
                                                ],
                                                [],
                                                []));
                                            setState(() {});
                                            Navigator.of(context).pop();
                                          })
                                    ],
                                  ),
                                );
                              });
                        },
                        child: const Text(
                          'Add Friend',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: iconColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  ),
                ),
                TotalBalanceCard(
                  amount: myBalance(),
                ),
                Expanded(
                  child: CardListViewBuilder(widgets: [
                    for (Group i in groups
                        .where((element) => element.participants.length == 2))
                      FriendsCard(
                          amount: i.debt[i.participants.indexWhere(
                                  (element) => element == userName)] *
                              -1,
                          userIcon: const CircularIcon(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            bgColor: Colors.blueGrey,
                          ),
                          string: i.participants[1],
                          callback: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        FriendsTransactionsScreen(
                                          group: i,
                                        )));
                          }),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  double myBalance() {
    double balance = 0;
    for (Group i in groups) {
      balance += i.debt[0];
    }
    return balance;
  }
}
