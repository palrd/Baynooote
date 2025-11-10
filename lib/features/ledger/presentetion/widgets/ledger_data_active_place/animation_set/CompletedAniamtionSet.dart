import 'dart:math';

import 'package:baynooote/features/ledger/di/ledger_module.dart';

///这个动画类用来初始化用户输入完数据之后的动画
class Completedaniamtionset {
  late AnimationController controller;
  late Animation<double> scaleX;
  late Animation<double> scaleY;
  late Animation<double> scaleBX;
  late Animation<double> scaleBY;
  late Animation<double> rotateXA;
  late Animation<double> rotateXB;

  Completedaniamtionset(this.controller) {
    action1();
    action2();
  }

  void action1() {
    scaleX =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 1.05,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 40,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.05,
              end: 0.95,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.95,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOutCubic)),
            weight: 15,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 0,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 15,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.5)),
        );

    scaleY =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 0.95,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 40,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.95,
              end: 1.05,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.05,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOutCubic)),
            weight: 15,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 0,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 15,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.5)),
        );
  }

  void action2() {
    ///形变
    scaleBX =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.0,
              end: 1.05,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.05,
              end: 0.95,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.95,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 60,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0.5, 1.0)),
        );

    scaleBY =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.0,
              end: 0.95,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.95,
              end: 1.05,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.05,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 60,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0.5, 1.0)),
        );

    rotateXB = Tween(begin: pi / 2, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.75, curve: Curves.easeIn),
      ),
    );
  }
}
