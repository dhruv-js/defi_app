import 'dart:ffi';

import 'package:defi_app/model/transaction.dart';
import 'package:defi_app/res/colors.dart';
import 'package:defi_app/utils/constants.dart';
import 'package:defi_app/view/widget/button.dart';
import 'package:defi_app/view/widget/gradient_background.dart';
import 'package:defi_app/view/widget/total_balance_card.dart';
import 'package:defi_app/view/widget/transaction_card.dart';
import 'package:flutter/material.dart';

import '../../model/group.dart';
import '../widget/card_list_view_builder.dart';
import '../widget/circular_icon.dart';

class FriendsTransactionsScreen extends StatefulWidget {
  final Group group;
  const FriendsTransactionsScreen({super.key, required this.group});

  @override
  State<FriendsTransactionsScreen> createState() =>
      _FriendsTransactionsScreenState();
}

class _FriendsTransactionsScreenState extends State<FriendsTransactionsScreen> {
  TextEditingController amountController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  String? dropDownValue;

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
                heightRatio: 0.18,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        iconSize: 28,
                        color: iconColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 32.0,
              left: 16.0,
              right: 16.0,
            ),
            child: TotalBalanceCard(amount: widget.group.debt[0]),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: GradientButton(
                text: 'Settle Up',
                onPressed: () {
                  for (Group i in groups) {
                    if (i.groupTitle == widget.group.groupTitle) {
                      for (int j = 0; j < i.debt.length; j++) {
                        i.debt[j] = 0;
                      }
                    }
                  }
                  setState(() {});
                }),
          ),
          Expanded(
            child: CardListViewBuilder(widgets: [
              for (Transaction i in widget.group.transactions)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TransactionCard(
                        userIcon: const CircularIcon(
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          bgColor: Colors.blueGrey,
                        ),
                        amount: i.amt,
                        string: i.title,
                        date: i.date)),
            ]),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 65,
        width: 150,
        child: ElevatedButton(
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
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 32.0, bottom: 16.0),
                          child: Text(
                            'Add Expense',
                            style: TextStyle(
                                color: iconColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            style: const TextStyle(color: iconColor),
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: iconColor),
                              border: OutlineInputBorder(),
                              labelText: 'Enter Description',
                            ),
                            controller: descriptionController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 8.0),
                          child: TextField(
                            style: const TextStyle(color: iconColor),
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: iconColor),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.0, color: Colors.white)),
                              labelText: 'Enter Amount',
                            ),
                            controller: amountController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 16.0, left: 16.0, right: 16.0),
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 4.0),
                                child:
                                    Icon(Icons.info_outline, color: iconColor),
                              ),
                              Text('This amount is split equally',
                                  style: TextStyle(
                                      color: iconColor, fontSize: 18)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 16.0, left: 16.0, right: 16.0),
                          child: StatefulBuilder(builder: (context, setState) {
                            return DropdownButton(
                              dropdownColor: textColor,
                              isExpanded: true,
                              style: const TextStyle(color: textColor),
                              value: dropDownValue,
                              hint: const Text('Paid By',
                                  style: TextStyle(color: iconColor)),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              focusColor: textColor,
                              items:
                                  widget.group.participants.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: const TextStyle(color: iconColor),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownValue = newValue!;
                                });
                              },
                            );
                          }),
                        ),
                        GradientButton(
                            text: 'Add Expense',
                            onPressed: () {
                              groups
                                  .firstWhere((element) =>
                                      element.groupTitle ==
                                      widget.group.groupTitle)
                                  .transactions
                                  .add(Transaction(
                                      double.parse(amountController.text),
                                      DateTime.now(),
                                      dropDownValue!,
                                      descriptionController.text));

                              updateDebt(
                                  widget.group.groupTitle,
                                  dropDownValue!,
                                  double.parse(amountController.text));
                              Navigator.of(context).pop();
                              setState(() {});
                            })
                      ],
                    ),
                  );
                });
          },
          child: const Text(
            'Add Expense',
            style: TextStyle(
                color: iconColor, fontSize: 20.0, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }

  void updateDebt(String groupTitle, String payer, double amt) {
    for (Group i in groups) {
      if (i.groupTitle == groupTitle) {
        double perPerson = amt / i.participants.length;
        int payerIndex =
            i.participants.indexWhere((element) => element == payer);
        for (int j = 0; j < i.debt.length; j++) {
          i.debt[j] += perPerson;
        }
        i.debt[payerIndex] -= amt;
      }
    }
  }
}
