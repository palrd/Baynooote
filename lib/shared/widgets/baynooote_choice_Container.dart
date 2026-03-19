import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/bus/bottom_sheet_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///这个组件用来创建一个Telegram风格的选择按钮，当按下时
///它的内部容器会缩小
class BaynoooteChoiceContainer<T> extends StatefulWidget {
  final VoidCallback? onTap;
  final ValueListenable<T> listenValue;
  final T value;
  final double containerWidth;
  final double containerHeight;
  final double borderWidth;
  final Color backgroundColor;
  final Widget? icon;
  const BaynoooteChoiceContainer({
    required this.listenValue,
    required this.value,
    this.icon,
    this.containerWidth = 40,
    this.containerHeight = 40,
    this.borderWidth = 3,
    this.onTap,
    this.backgroundColor = const Color.fromARGB(255, 255, 255, 255),
    super.key,
  });

  @override
  State<BaynoooteChoiceContainer> createState() =>
      _BaynoooteChoiceContainerState();
}

class _BaynoooteChoiceContainerState extends State<BaynoooteChoiceContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation scale;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    widget.listenValue.addListener(onBusChanged);
  }

  void onBusChanged() {
    if (widget.listenValue.value == widget.value) {
      _active();
    } else {
      _unactive();
    }
  }

  void _active() {
    controller.forward();
  }

  void _unactive() {
    controller.reverse();
  }

  void _initAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    scale = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.1,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.1,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 40,
      ),
    ]).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    widget.listenValue.removeListener(onBusChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        widget.onTap?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(5, 0, 0, 0),
              offset: Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: controller,
              child: Container(
                alignment: Alignment.center,
                height: widget.containerHeight,
                width: widget.containerWidth,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget.backgroundColor,
                    width: widget.borderWidth,
                  ),
                ),
                child: Center(),
              ),
              builder: (_, child) {
                return Transform.scale(scale: scale.value, child: child);
              },
            ),
            ValueListenableBuilder(
              valueListenable: widget.listenValue,
              builder: (context, isSelect, _) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  alignment: Alignment.center,
                  transformAlignment: Alignment.center,
                  transform: Matrix4.diagonal3Values(
                    widget.listenValue.value == widget.value
                        ? 0.78
                        : 1.0,
                    widget.listenValue.value == widget.value
                        ? 0.78
                        : 1.0,
                    1.0,
                  ),
                  height: widget.containerHeight,
                  width: widget.containerWidth,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.backgroundColor,
                  ),
                  child: Center(),
                );
              },
            ),
            widget.icon!,
          ],
        ),
      ),
    );
  }
}
