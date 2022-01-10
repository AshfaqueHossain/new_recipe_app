import 'package:flutter/material.dart';

import 'models.dart';

class ProfileManager extends ChangeNotifier {
  User get getUser => User(
    firstName: 'Ashfaque',
    lastName: 'Hossain',
    role: 'Head Sheff',
    profileImageUrl: 'assets/profile_pics/pro_pic.jpg',
    points: 100,
    darkMode: _darkMode,
  );

  bool get didSelectUser => _didSelectUser;
  bool get didTapOnShayanrecipes => _tapOnShayanrecipes;
  bool get darkMode => _darkMode;

  var _didSelectUser = false;
  var _tapOnShayanrecipes = false;
  var _darkMode = false;

  void set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnShayanrecipes(bool selected) {
    _tapOnShayanrecipes = selected;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectUser = selected;
    notifyListeners();
  }
}