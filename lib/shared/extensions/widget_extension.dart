import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension WidgetExtension on Widget {
  Widget addTapFeel({
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    bool isSelfAnimationWillHappen = false,
    bool isUseLongPress = false,
    int triggerTimer = 150,
    int feelingLevel = 3,
  }) {
    return QsqushFeel(
      onTap: onTap,
      onLongPress: onLongPress,
      isSelfAnimationWillHappen: isSelfAnimationWillHappen,
      isUseLongPress: isUseLongPress,
      feelingLevel: feelingLevel,
      triggerTimer: triggerTimer,
      child: this,
    );
  }
}

class QsqushFeel extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool? isSelfAnimationWillHappen;
  final bool? isUseLongPress;
  final int? feelingLevel;
  final int? triggerTimer;
  const QsqushFeel({
    this.onTap,
    this.onLongPress,
    this.isSelfAnimationWillHappen,
    this.isUseLongPress,
    this.child,
    this.feelingLevel,
    this.triggerTimer,
    super.key,
  });

  @override
  State<QsqushFeel> createState() => _QsqushFeelState();
}

class _QsqushFeelState extends State<QsqushFeel>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation scale;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    switch (widget.feelingLevel) {
      case 1:
        press(0.9, 1.03);
      case 2:
        press(0.85, 1.05);
      case 3:
        press(0.8, 1.1);
    }
  }

  void _startTimer() {
    ///执行一次后再连发
    _trigger();

    timer = Timer.periodic(Duration(milliseconds: widget.triggerTimer!), (
      time,
    ) {
      _trigger();
    });
  }

  void _trigger() {
    HapticFeedback.selectionClick();
    widget.onTap?.call();
  }

  void _stopTimer() {
    ///暂停计时器
    timer?.cancel();

    ///清空定时器
    timer = null;
  }

  void press(double min, double max) {
    scale = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: min,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: min,
          end: max,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: max,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 30,
      ),
    ]).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        controller.animateTo(0.4);
        HapticFeedback.selectionClick();
      },
      onTapUp: (_) {
        ///如果child本身就有伸缩类型的动画在抬起后触发，那么就不回弹了，直接执行chld本身手指抬起时逻辑
        if (!widget.isSelfAnimationWillHappen!) {
          controller.forward().then((_) {
            controller.reset();
          });
          widget.onTap?.call();
        } else {
          controller.forward().then((_) {
            widget.onTap?.call();
          });
        }
      },
      onLongPressStart: widget.isUseLongPress!
          ? (_) {
              ///触发长按逻辑
              _startTimer();
              controller.animateTo(0.4);
            }
          : null,
      onLongPressUp: widget.isUseLongPress!
          ? () {
              ///触发长按逻辑
              _stopTimer();
              controller.forward().then((_) {
                widget.onTap?.call();
              });
            }
          : null,

      onTapCancel: () {
        controller.forward().then((_) {
          controller.reset();
        });
        HapticFeedback.selectionClick();
      },
      child: AnimatedBuilder(
        animation: controller,
        builder: (ctx, child) {
          return Transform.scale(
            alignment: Alignment.center,
            scale: scale.value,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
