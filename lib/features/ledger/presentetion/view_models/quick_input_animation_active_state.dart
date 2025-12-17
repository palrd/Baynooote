import 'package:flutter/material.dart';

///用于管理顶部类型选择栏的动画状态
class QuickAnimationActiveState extends ChangeNotifier {
  ///命名方式为 动画名称+ActiveState
  ///用于管理快速记录卡片中的类型选择器动画状态
  ///初始状态为false,此时是位于时间选择上
  ///如果为true，则表示位于具体类型上
  bool _typeChoiceBarActiveState = false;

  ///用于记录当前被选中的icon index
  int _selectedIndex = 0;

  ///提供getter
  bool get typeChoiceBarActiveState => _typeChoiceBarActiveState;
  int get selectedIndexActiveState => _selectedIndex;

  ///提供setter
  void changeTypeChoiceBarActiveState(bool state) {
    _typeChoiceBarActiveState = state;
    notifyListeners();
  }

  ///传入一个index并更新
  void changeSelectedIndexActiveState(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
