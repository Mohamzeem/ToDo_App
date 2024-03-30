import 'package:flutter/material.dart';

class ChipText extends StatelessWidget {
  final String text;
  const ChipText({
    super.key,
    required this.text,
  });

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
