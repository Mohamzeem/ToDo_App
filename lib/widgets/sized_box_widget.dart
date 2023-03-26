// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
    );
  }
}
