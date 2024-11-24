import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  bool _notifications = true;
  bool _darkMode = false;

  bool get notifications => _notifications;
  bool get darkMode => _darkMode;

  void toogleNotifications(bool value) {
    _notifications = value;
    notifyListeners();
  }

  void toogleDarkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }
}
