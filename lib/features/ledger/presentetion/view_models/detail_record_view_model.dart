import 'package:flutter/material.dart';

class DetailRecordViewModel extends ChangeNotifier {
  int _maxLine = 1;

  int get maxLine => _maxLine;

  void changeMaxLine(int value) {
    _maxLine = value;
  }
}
