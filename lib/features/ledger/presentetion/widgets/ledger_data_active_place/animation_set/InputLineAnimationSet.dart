import 'dart:math';

import 'package:flutter/material.dart';

class Inputlineanimationset {
  late AnimationController controller;
  late Animation scaleX;
  late Animation<Alignment> alignment;
  late Animation<double> rotateXAfter1;
  late Animation<double> rotateXAfter2;
  late Animation<double> rotateXAfter3;
  late Animation<double> rotateXAfter4;
  late Animation<double> scaleAfter1;
  late Animation<double> scaleAfter2;
  late Animation<double> scaleAfter3;
  late Animation<double> scaleAfter4;
  late Animation<double> scaleAfter5;

  Inputlineanimationset(this.controller) {
    action();
  }

  void action() {
    scaleX = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeInOut),
      ),
    );
    alignment = Tween(begin: Alignment.center, end: Alignment.centerRight)
        .animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.2, curve: Curves.easeInOut),
          ),
        );
    rotateXAfter1 = Tween(begin: pi / 2, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 0.5, curve: Curves.easeInOut),
      ),
    );
    rotateXAfter2 = Tween(begin: pi / 2, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeInOut),
      ),
    );
    rotateXAfter3 = Tween(begin: pi / 2, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.55, 0.9, curve: Curves.easeInOut),
      ),
    );
    rotateXAfter4 = Tween(begin: pi / 2, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeInOut),
      ),
    );

    scaleAfter1 = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.1,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.1,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 30,
      ),
    ]).animate(CurvedAnimation(parent: controller, curve: Interval(0.2, 0.6)));

    scaleAfter2 = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.1,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.1,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 30,
      ),
    ]).animate(CurvedAnimation(parent: controller, curve: Interval(0.4, 0.8)));

    scaleAfter3 = TweenSequence(
      [
        TweenSequenceItem(
          tween: Tween(
            begin: 0.0,
            end: 1.1,
          ).chain(CurveTween(curve: Curves.easeInOut)),
          weight: 70,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 1.1,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 30,
        ),
      ],
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.55, 0.95)));
    scaleAfter4 = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.1,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.1,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 30,
      ),
    ]).animate(CurvedAnimation(parent: controller, curve: Interval(0.7, 1.0)));

    scaleAfter5 = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.1,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 70,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.1,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 30,
      ),
    ]).animate(CurvedAnimation(parent: controller, curve: Interval(0.85, 1.0)));
  }
}
