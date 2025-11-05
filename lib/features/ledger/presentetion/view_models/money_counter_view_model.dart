import 'package:flutter/material.dart';

class MoneyCounterViewModel extends ChangeNotifier {
  double _moneyNumber = 0.0;
  int _index = 0;
  bool _shouldSubmit = false;
  bool _alreadFocused = false;

  double get moneyNumber => _moneyNumber;
  int get index => _index;
  bool get shouldSubmit => _shouldSubmit;
  bool get alreadFocused => _alreadFocused;

  void changeMoneyNumber(value) {
    _moneyNumber = value;
    if (value == 0) {
      _index = 0;
    } else if (value <= 10 && value > 0) {
      _index = 1;
    } else if (value > 10 && value < 50) {
      _index = 2;
    } else if (value >= 50 && value <= 200) {
      _index = 3;
    } else {
      _index = 4;
    }
    notifyListeners();
  }

  void triggerSubmit() {
    _shouldSubmit = true;
  }

  void resetSubmit() {
    _shouldSubmit = false;
  }

  void resetFocus() {
    _alreadFocused = !_alreadFocused;
  }
}
