import 'package:baynooote/features/ledger/di/ledger_module.dart';

class MoneyCounterViewModel extends ChangeNotifier {
  double _moneyNumber = 0.0;


  double get moneyNumber => _moneyNumber;

  void changeMoneyNumber(value) {
    _moneyNumber = value;
    notifyListeners();
  }
}
