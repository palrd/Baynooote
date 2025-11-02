import 'package:flutter/material.dart';

class DetailRecordViewModel extends ChangeNotifier {
  ///记录最大行数
  int _maxLine = 1;

  ///记录是否缩放
  double _scale = 1.0;

  ///记录高度
  double _height = 50.0;

  int get maxLine => _maxLine;
  double get scale => _scale;
  double get height => _height;

  void changeMaxLine(int value) {
    _maxLine = value;
    notifyListeners();
  }

  void changeScale(value) {
    _scale = value;
    notifyListeners();
  }

  void changeHeight(value) {
    _height = value;
    

    notifyListeners();
  }
}
