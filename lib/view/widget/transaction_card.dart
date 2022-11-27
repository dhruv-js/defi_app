import 'package:defi_app/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.amount,
    this.userIcon,
    required this.string,
    required this.date,
  });

  final Widget? userIcon;
  final String string;
  final DateTime date;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            children: [
              Text(DateFormat.MMMM().format(date).substring(0, 3),
                  style: const TextStyle(color: iconColor, fontSize: 20)),
              Text(date.day.toString(),
                  style: const TextStyle(color: iconColor, fontSize: 20)),
            ],
          ),
        ),
        Expanded(
            child: Card(
          margin: const EdgeInsets.all(2),
          color: cardColor,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(children: [
              userIcon ?? const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  string,
                  style: const TextStyle(color: iconColor, fontSize: 20),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    '\$${amount.abs()}',
                    style: const TextStyle(color: iconColor, fontSize: 20),
                  ),
                ],
              ),
            ]),
          ),
        )),
      ],
    );
  }
}
