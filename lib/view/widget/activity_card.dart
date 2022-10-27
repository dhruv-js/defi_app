import 'package:intl/intl.dart';
import 'package:defi_app/res/colors.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  ActivityCard({
    super.key,
    required this.amount,
    required this.userIcon,
    required this.userName,
  });

  final String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  final String time = DateFormat("hh:mm:ss a").format(DateTime.now());
  final Widget userIcon;
  final String userName;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(2),
      color: const Color(0xff282A2F),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Row(children: [
          const Spacer(
            flex: 1,
          ),
          userIcon,
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amount > 0 ? '$userName paid You' : 'You paid $userName',
                  style: const TextStyle(
                    color: iconColor,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'You paid \$${amount.abs()}',
                  style: const TextStyle(color: textColor, fontSize: 13),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  '$date at $time',
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 5,
          ),
        ]),
      ),
    );
  }
}
