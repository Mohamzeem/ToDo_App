import 'package:flutter/material.dart';

class ChipText extends StatelessWidget {
  final String text;
  const ChipText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
        elevation: 5,
        label: Text(
          text,
          style: Theme.of(context).textTheme.displayLarge,
        ));
  }
}
