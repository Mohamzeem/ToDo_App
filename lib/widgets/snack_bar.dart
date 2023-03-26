import 'package:flutter/material.dart';

class ShowSnackBar {
  void showSuccessSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }

  void showErrorSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
