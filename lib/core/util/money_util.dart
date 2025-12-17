import 'package:flutter/widgets.dart';

class MoneyUtil {
  static int changeYuanToFen(double money) {
    if (money == 0) {
      return 0;
    }
    try {
      debugPrint("金额转换：$money,结果：${(money * 100).round()}");

      return (money * 100).round();
    } catch (e) {
      return 0;
    }
  }
}
