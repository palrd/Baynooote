import 'package:flutter/material.dart';

///用来管理数据活动区的状态
class DataActivePlaceViewModel extends ChangeNotifier {
  ///是否有数据的状态值
  bool _hasData = false;

  ///提供getter
  bool get hasData => _hasData;

  ///提供set方法
  void setHasData() {
    _hasData = !_hasData;

    ///通知ui更新
    notifyListeners();
  }
}
