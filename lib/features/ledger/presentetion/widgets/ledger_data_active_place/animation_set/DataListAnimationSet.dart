import 'package:flutter/material.dart';

class Datalistanimationset {
  late AnimationController controller;
  late Animation scaleX;
  late Animation scaleY;
  late Animation translateY;
  // late Animation width;

  Datalistanimationset(this.controller) {
    action();
  }

  void action() {
    scaleX =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween(
              begin: 0.95,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 100,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0, 1.0)),
        );

    scaleY =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween(
              begin: 1.05,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 100,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0, 1.0)),
        );

    translateY =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween(
              begin: -1000,
              end: 0.0,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 100,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0, 1.0)),
        );
  }
}
