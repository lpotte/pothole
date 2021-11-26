import 'package:flutter/material.dart';

class businessLogicProvider extends ChangeNotifier {
  int _logged = 0;

  get getLogged => _logged;

  void setLogged(int key) {
    _logged = key;
    notifyListeners();
  }
}
