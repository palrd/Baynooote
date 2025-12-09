import 'package:baynooote/core/db/app_database.dart';
import 'package:baynooote/features/ledger/di/ledger_module.dart';

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

  ///触发提交时
  void triggerSubmit(context) {
    _confirmRecord(context);
    _shouldSubmit = true;
  }

  void _confirmRecord(BuildContext context) {
    final confirmVM = context.read<RecordCompletedViewModel>();
    final db = context.read<AppDatabase>();

    ///数据载入
    confirmVM
      ..setUserName("Paladepa")
      ..setComfirmedMoney(context.read<MoneyCounterViewModel>().moneyNumber)
      ..setComfirmedIndex(
        context.read<QuickAnimationActiveState>().selectedIndexActiveState,
      )
      ..setIsRecordDetail(true)
      ..setConfirmedDate(
        DateTime.now().hour.toString().padLeft(2, '0') +
            ":" +
            DateTime.now().minute.toString().padLeft(2, '0'),
      )
      ..setTimeUnit((DateTime.now().hour >= 12 ? "PM" : "AM").toString())
      ..setIsInsertDB(true)
      ..setConfirmedLightIndex(context.read<MoneyCounterViewModel>().index);
  }

  void resetSubmit() {
    _shouldSubmit = false;
  }

  void resetFocus() {
    _alreadFocused = !_alreadFocused;
  }
}
