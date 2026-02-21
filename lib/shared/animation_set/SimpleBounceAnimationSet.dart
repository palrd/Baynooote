import 'package:flutter/material.dart';

class Simplebounceanimationset {
  late AnimationController controller;
  late Animation<double> scale;

  Simplebounceanimationset(this.controller) {
    scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.1,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.1,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
    ]).animate(controller);
  }
}
