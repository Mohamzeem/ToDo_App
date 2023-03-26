import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final int fontSize;
  final FontWeight fontWeight;
  const CustomTextWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}
