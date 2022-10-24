import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white.withOpacity(0.2),
      ),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Icon(
            Icons.search,
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        Text(
          'Add Friends',
          style: TextStyle(
            color: Colors.white.withOpacity(0.4),
            fontSize: 20,
          ),
        )
      ]),
    );
  }
}
