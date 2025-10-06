import 'package:flutter/material.dart';

class StateCardViewModel extends ChangeNotifier {
  ///状态管理
  ///是否要展示卡片选择器
  bool _isShowCardChoice = true;
  ///是否展示卡片旁边的按钮
  bool _isShowCardSideBtn = false;

  ///提供状态值的get方法
  bool get isShowCardChoice => _isShowCardChoice;
  bool get isShowCardSideBtn => _isShowCardSideBtn;

  ///暴露状态管理方法
  ///改变是否展示卡片选择器
  void changeIsShowCardChoice() {
    ///反转值
    _isShowCardChoice = !_isShowCardChoice;
    ///通知UI组件更新
    notifyListeners();
  }

  ///改变是否展示选择按钮
  void changeIsShowCardSideBtn() {
    ///反转值
    _isShowCardSideBtn = !_isShowCardSideBtn;
    ///通知UI组件更新
    notifyListeners();
  }
}
