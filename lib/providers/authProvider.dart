import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  int _logged = 0;

  AuthProvider() {
    _readSharedPreferences();
  }

  get getLogged => _logged;

  void setLogged(int key) {
    _logged = key;
    _saveSharedPreferences();
    notifyListeners();
  }

  _readSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final sharedLogged = prefs.getInt('_logged');
    if (sharedLogged != null) {
      _logged = sharedLogged;
      notifyListeners();
    }
  }

  _saveSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('_logged', _logged);
  }
}
