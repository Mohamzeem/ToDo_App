// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/text_widget.dart';

class CustomElvatedBtnWithIcon extends StatelessWidget {
  const CustomElvatedBtnWithIcon({
    super.key,
    required this.labelText,
    required this.onPressed,
    required this.iconData,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.width,
    required this.height,
  });
  final String labelText;
  final void Function() onPressed;
  final IconData iconData;
  final Color backgroundColor;
  final Color foregroundColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          minimumSize: Size(MediaQuery.of(context).size.width * width,
              MediaQuery.of(context).size.height * height)),
      label: CustomTextWidget(
          text: labelText,
          color: foregroundColor,
          fontSize: 18,
          fontWeight: FontWeight.w500),
      onPressed: onPressed,
      icon: Icon(iconData),
    );
  }
}
