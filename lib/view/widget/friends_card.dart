import 'package:defi_app/res/colors.dart';
import 'package:flutter/material.dart';

class FriendsCard extends StatelessWidget {
  const FriendsCard({
    super.key,
    this.amount,
    this.userIcon,
    required this.string,
    required this.callback,
  });

  final Widget? userIcon;
  final String string;
  final VoidCallback callback;
  final double? amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(2),
      color: cardColor,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
          amount != null
              ? Column(
                  children: [
                    Text(
                      amount! > 0 ? 'you lent' : 'you owe',
                      style: const TextStyle(color: textColor, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '\$${amount!.abs()}',
                      style: const TextStyle(color: iconColor, fontSize: 15),
                    ),
                  ],
                )
              : const SizedBox(),
          IconButton(
              onPressed: callback,
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: iconColor,
                size: 16,
              ))
        ]),
      ),
    );
  }
}
