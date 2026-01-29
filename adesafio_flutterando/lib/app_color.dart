import 'package:flutter/material.dart';

class AppColor {
  AppColor._();
  static const Color gradientPink = Color(0xFFFD297B);
  static const Color primaryOrange = Color(0xFFFF655B);
}

class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryOrange,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.primaryOrange, AppColor.gradientPink],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
