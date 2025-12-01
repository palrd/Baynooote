import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:flutter/material.dart';

class TipContentViewModel with ChangeNotifier {
  String _content = '你好呀，帕拉德帕';

  String get content => _content;

  TipContentViewModel(ConfirmButtonState vm) {
    vm.addListener(() => changeContentByIndex(vm.inputState));
  }

  void changeContentByIndex(int index) {
    if (index == 0) {
      _content = '你好呀，帕拉德帕';
    }
    notifyListeners();
  }
}
