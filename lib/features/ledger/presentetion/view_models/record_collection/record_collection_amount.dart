import 'package:baynooote/features/ledger/di/ledger_module.dart';

class RecordCollectionAmountViewModel extends ChangeNotifier {
  double _amount = 0.0;
  double get amount => _amount;
  void updateAmount(double amount) {
    _amount = amount;
    notifyListeners();
  }
}
