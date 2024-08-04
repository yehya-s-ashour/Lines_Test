import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showAlert(
  context, {
  required String message,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: SizedBox(
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    ),
    margin: EdgeInsets.only(
      bottom: 100.h,
      right: 90.w,
      left: 90.w,
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    // width: width,
    elevation: 20,
    behavior: SnackBarBehavior.floating,
  ));
}
