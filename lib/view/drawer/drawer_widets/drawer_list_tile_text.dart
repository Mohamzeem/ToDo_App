import 'package:flutter/material.dart';

class ListTileDrawerText extends StatelessWidget {
  final Function() onTap;
  final IconData iconData;
  final String title;
  final String trailing;
  const ListTileDrawerText({
    Key? key,
    required this.onTap,
    required this.iconData,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: Text(
        trailing,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
