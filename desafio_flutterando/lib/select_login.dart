import 'package:flutter/material.dart';
import 'package:desafio_flutterando/app_color.dart';

class SelectLoginTinder extends StatelessWidget {
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
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: (Image.asset(
                'assets/images/logo.png',
                color: Colors.white,
              )),
            ),
            SizedBox(height: 30),

            Text(
              'Location Changer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Plugin app for Tinder',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),

            SizedBox(height: 30),

            SizedBox(
              width: 215,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  print('Logou ');
                  Navigator.of(context).pushNamed('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColor.primaryOrange,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Login with Email',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.75,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
