import 'package:defi_app/res/colors.dart';
import 'package:flutter/material.dart';

class TotalBalanceCard extends StatelessWidget {
  const TotalBalanceCard({super.key, required this.amount});

  final double amount;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Total Balance',
                style: TextStyle(
                    color: iconColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                '${amount > 0 ? 'You are owed' : 'You owe'} \$${amount.abs()}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: iconColor,
                  fontSize: 27.5,
                ),
              ),
            ]),
          )),
    );
  }
}
