import 'package:flutter/material.dart';

class appController extends ChangeNotifier {
  static appController instance = appController();

  bool isDarkTheme = false;
  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
