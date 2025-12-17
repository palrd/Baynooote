import 'dart:math';

import 'package:baynooote/features/ledger/di/ledger_module.dart';

///这个动画类用来初始化用户输入完数据之后的动画
class Completedaniamtionset2 {
  late AnimationController controller;
  late Animation<double> rotateXAfter1;
  late Animation<double> rotateXAfter2;
  late Animation<double> rotateXAfter3;
  late Animation<double> rotateXAfter4;

  Completedaniamtionset2(this.controller) {
    action();
  }

  ///针对所有完成后的小组件的展示动画
  void action() {
    rotateXAfter1 = Tween(begin: pi / 2, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.easeInOut),
      ),
    );
    rotateXAfter2 = Tween(begin: pi / 2, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 0.5, curve: Curves.easeInOut),
      ),
    );
    rotateXAfter3 = Tween(begin: pi / 2, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.45, 0.75, curve: Curves.easeInOut),
      ),
    );
    rotateXAfter4 = Tween(begin: pi / 2, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeInOut),
      ),
    );
  }
}
