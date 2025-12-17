import 'package:baynooote/features/ledger/di/ledger_module.dart';

enum RecordType { income, expend }

class RecordCollectionViewModel extends ChangeNotifier {
  RecordType _recordType = RecordType.expend;

  ///0表示支出
  ///1表示收入
  RecordType get recordType => _recordType;

  void changeRecordType() {
    _recordType = _recordType == RecordType.expend
        ? RecordType.income
        : RecordType.expend;
    notifyListeners();
  }
}
