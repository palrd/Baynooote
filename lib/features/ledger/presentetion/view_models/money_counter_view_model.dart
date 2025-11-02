import 'package:flutter/material.dart';

class MoneyCounterViewModel extends ChangeNotifier {
  double _moneyNumber = 0;
  int _index = 0;

  double get moneyNumber => _moneyNumber;
  int get inedx => _index;

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
}
