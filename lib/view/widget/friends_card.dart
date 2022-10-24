import 'package:flutter/material.dart';

class FriendsCard extends StatelessWidget {
  const FriendsCard({
    super.key,
    required this.amount,
    required this.userIcon,
    required this.userName,
    required this.callback,
  });

  final Icon userIcon;
  final String userName;
  final VoidCallback callback;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff282A2F),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(children: [
          userIcon,
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              userName,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                amount > 0 ? 'owes you' : 'you owe',
                style: const TextStyle(color: Color(0xff9B9B9B), fontSize: 15),
              ),
              Text(
                '\$${amount.abs()}',
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          IconButton(
              onPressed: callback,
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 16,
              ))
        ]),
      ),
    );
  }
}
