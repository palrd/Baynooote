import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/detail_record_view_model.dart';

///用来管理按钮样式的状态
class ConfirmButtonState extends ChangeNotifier {
  ///该状态值有三个状态
  ///1：默认样式
  ///2：输入框被点击但是没有输入数据
  ///3：输入框被点击后输入了数据

  int _inputState = 0;

  int get inputState => _inputState;

  void changeState(int value) {
    _inputState = value;
    notifyListeners();
  }
}
