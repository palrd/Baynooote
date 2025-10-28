import 'package:flutter/material.dart';

class MoneyCounterViewModel extends ChangeNotifier {
  late double _moneyNumber = 0;

  double get moneyNumber => _moneyNumber;

  void changeMoneyNumber(value) {
    _moneyNumber = value;
    notifyListeners();
  }
}
