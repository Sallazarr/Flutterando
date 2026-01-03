import 'package:flutter/material.dart';

class LoginTinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 98, 87),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_fire_department, size: 100, color: Colors.white),
            Text('Location Changer'),
          ],
        ),
      ),
    );
  }
}
