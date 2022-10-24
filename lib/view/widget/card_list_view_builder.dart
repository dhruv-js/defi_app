import 'package:flutter/material.dart';

class CardListViewBuilder extends StatelessWidget {
  const CardListViewBuilder({super.key, required this.widgets});

  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return widgets[index];
        },
        itemCount: widgets.length);
  }
}
