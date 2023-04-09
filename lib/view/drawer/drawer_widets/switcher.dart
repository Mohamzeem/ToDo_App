// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MySwitcher extends StatefulWidget {
  bool isTrue;
  final void Function(bool) onToggle;
  final String activeIcon;
  final String activeText;
  final String inactiveIcon;
  final String inactiveText;
  final double paddingLeft;
  final double paddingRight;
  MySwitcher({
    Key? key,
    required this.isTrue,
    required this.onToggle,
    required this.activeIcon,
    required this.activeText,
    required this.inactiveIcon,
    required this.inactiveText,
    required this.paddingLeft,
    required this.paddingRight,
  }) : super(key: key);

  @override
  State<MySwitcher> createState() => _MySwitcherState();
}

class _MySwitcherState extends State<MySwitcher> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.paddingLeft.w, right: widget.paddingRight),
      child: FlutterSwitch(
        padding: 2,
        valueFontSize: 15.sp,
        toggleSize: 32.r,
        width: 80.w,
        height: 30.h,
        showOnOff: true,
        activeIcon: Text(
          widget.activeIcon,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        activeText: widget.activeText,
        inactiveIcon: Text(
          widget.inactiveIcon,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        inactiveText: widget.inactiveText,
        inactiveColor: Colors.grey,
        activeColor: Colors.grey,
        activeTextFontWeight: FontWeight.w500,
        inactiveTextFontWeight: FontWeight.w500,
        value: widget.isTrue,
        onToggle: widget.onToggle,
      ),
    );
  }
}
