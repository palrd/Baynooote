import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget addTapFeel({VoidCallback? onTap}) {
    return QsqushFeel(onTap: onTap, child: this);
  }
}

class QsqushFeel extends StatefulWidget {
  final Widget? child;
  final VoidCallback? onTap;
  const QsqushFeel({this.onTap, this.child, super.key});

  @override
  State<QsqushFeel> createState() => _QsqushFeelState();
}

class _QsqushFeelState extends State<QsqushFeel>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    press();
  }

  void press() {
    scale = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 1.0,
          end: 0.8,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.8,
          end: 1.1,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.1,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 30,
      ),
    ]).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => controller.animateTo(0.4),
      onTapUp: (_) {
        controller.forward().then((_) {
          controller.reset();
        });
        widget.onTap?.call();
      },
      onTapCancel: () {
        controller.forward().then((_) {
          controller.reset();
        });
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
        child:  widget.child,
      ),
    );
  }
}
