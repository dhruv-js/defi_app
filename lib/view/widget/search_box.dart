import 'package:defi_app/res/colors.dart';
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
        color: iconColor.withOpacity(0.2),
      ),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Icon(
            Icons.search,
            color: iconColor.withOpacity(0.3),
          ),
        ),
        Text(
          'Add Friends',
          style: TextStyle(
            color: iconColor.withOpacity(0.4),
            fontSize: 20,
          ),
        )
      ]),
    );
  }
}
