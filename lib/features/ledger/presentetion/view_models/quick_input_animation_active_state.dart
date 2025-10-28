import 'package:flutter/material.dart';

///这个桥接模型用于管理动画状态
class QuickAnimationActiveState extends ChangeNotifier {
  ///命名方式为 动画名称+ActiveState
  ///用于管理快速记录卡片中的类型选择器动画状态
  ///初始状态为false,此时是位于时间选择上
  ///如果为true，则表示位于具体类型上
  bool _typeChoiceBarActiveState = false;

  ///用于记录当前被选中的icon index
  int _selectedIndexActiveState = 0;

  ///提供getter
  bool get typeChoiceBarActiveState => _typeChoiceBarActiveState;
  int get selectedIndexActiveState => _selectedIndexActiveState;

  ///提供setter
  void ChangeTypeChoiceBarActiveState(bool state) {
    _typeChoiceBarActiveState = state;
    notifyListeners();
  }

  ///传入一个index并更新
  void ChangeSelectedIndexActiveState(int index) {
    _selectedIndexActiveState = index;
    notifyListeners();
  }
}
