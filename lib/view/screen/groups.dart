import 'package:defi_app/res/colors.dart';
import 'package:defi_app/utils/constants.dart';
import 'package:defi_app/view/widget/button.dart';
import 'package:defi_app/view/widget/card_list_view_builder.dart';
import 'package:defi_app/view/widget/circular_icon.dart';
import 'package:defi_app/view/widget/friends_card.dart';
import 'package:defi_app/view/widget/gradient_background.dart';
import 'package:defi_app/view/widget/total_balance_card.dart';
import 'package:flutter/material.dart';

import '../../model/group.dart';
import 'groups_transactions.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  TextEditingController memberOfGroupController = TextEditingController();
  TextEditingController groupNameController = TextEditingController();
  List<String> members = [];

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
                        'Groups',
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
                                          'Create Group',
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
                                            labelText: 'Enter Group Name',
                                          ),
                                          controller: groupNameController,
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: TextField(
                                                style: const TextStyle(
                                                    color: iconColor),
                                                decoration:
                                                    const InputDecoration(
                                                  labelStyle: TextStyle(
                                                      color: iconColor),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 2.0,
                                                          color: Colors.white)),
                                                  labelText:
                                                      'Enter Member\'s Name',
                                                ),
                                                controller:
                                                    memberOfGroupController,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                members.add(
                                                    memberOfGroupController
                                                        .text);
                                                memberOfGroupController.text =
                                                    '';
                                              },
                                              child: const Text(
                                                'Add',
                                                style:
                                                    TextStyle(color: iconColor),
                                              ))
                                        ],
                                      ),
                                      GradientButton(
                                          text: 'Create Group',
                                          onPressed: () {
                                            groups.add(Group(
                                                [for (String i in members) 0],
                                                groupNameController.text,
                                                [
                                                  userName,
                                                  for (String i in members) i
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
                          'Create Group',
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
                        .where((element) => element.participants.length > 2))
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
                          string: i.groupTitle,
                          callback: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        GroupsTransactionsScreen(
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
}

double myBalance() {
  double balance = 0;
  for (Group i in groups) {
    balance += i.debt[0];
  }
  return balance;
}
