// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ListTileDrawerWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool value;
  final void Function(bool) onChanged;
  const ListTileDrawerWidget({
    Key? key,
    required this.iconData,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          iconData,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        trailing: Switch(value: value, onChanged: onChanged));
  }
}
