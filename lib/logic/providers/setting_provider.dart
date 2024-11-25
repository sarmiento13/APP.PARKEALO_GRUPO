import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  bool _notifications = true;
  bool _darkMode = false;
  Color _color = Colors.blue.shade400;

  bool get notifications => _notifications;
  bool get darkMode => _darkMode;
  Color get color => _color;

  void toogleNotifications(bool value) {
    _notifications = value;
    notifyListeners();
  }

  void toogleDarkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }

  void toogleColors(Color color) {
    _color = color;
    notifyListeners();
  }
}
