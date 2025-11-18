import 'package:flutter/material.dart';

///用来管理数据活动区的状态
class RecordCompletedViewModel extends ChangeNotifier {
  double _comfirmedMoney = 0.0;
  int _comfirmedIndex = 0;
  int _confirmedLightIndex = 0;
  bool _isRecordDetail = false;
  bool _isInsertDB = false;
  String _confirmedDate = '';
  String _timeUnit = '';
  String _userName = 'paladepa';

  double get comfirmedMoney => _comfirmedMoney;
  int get comfirmedIndex => _comfirmedIndex;
  int get confirmedLightIndex => _confirmedLightIndex;
  bool get isRecordDetail => _isRecordDetail;
  bool get isInsertDB => _isInsertDB;
  String get confirmedDate => _confirmedDate;
  String get userName => _userName;
  String get timeUnit => _timeUnit;

  void setComfirmedMoney(double money) {
    _comfirmedMoney = money;
  }

  void setComfirmedIndex(int index) {
    _comfirmedIndex = index;
  }

  void setIsRecordDetail(bool isDetail) {
    _isRecordDetail = isDetail;
  }

  void setIsInsertDB(bool isInsert) {
    _isInsertDB = isInsert;
  }

  void setConfirmedDate(String date) {
    _confirmedDate = date;
  }

  void setUserName(String name) {
    _userName = name;
  }

  void setConfirmedLightIndex(int index) {
    _confirmedLightIndex = index;
  }

  void setTimeUnit(String unit) {
    _timeUnit = unit;
  }
}
