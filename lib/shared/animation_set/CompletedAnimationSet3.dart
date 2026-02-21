import 'package:flutter/material.dart';

class Completedanimationset3 {
  late AnimationController controller;
  late Animation scaleX;
  late Animation scaleY;
  late Animation offsetX;

  Completedanimationset3(this.controller) {
    action1();
  }

  ///将盒子移出屏幕
  void action1() {
    offsetX = Tween(begin: 0.0, end: 400.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 0.5, curve: Curves.easeInOut),
      ),
    );
    scaleX =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween(
              begin: 1.0,
              end: 0.8,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 60,
          ),
          TweenSequenceItem(
            tween: Tween(
              begin: 0.8,
              end: 1.2,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 40,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0, 0.5)),
        );
    scaleY =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween(
              begin: 1.0,
              end: 1.2,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 60,
          ),
          TweenSequenceItem(
            tween: Tween(
              begin: 1.2,
              end: 0.8,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 40,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0, 0.5)),
        );
  }
}
