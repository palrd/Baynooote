import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///这个组件用来创建一个Telegram风格的选择按钮，当按下时
///它的内部容器会缩小
class BaynoooteChoiceContainer extends StatefulWidget {
  final VoidCallback? onTap;
  final double containerWidth;
  final double containerHeight;
  final double borderWidth;
  final Widget? icon;
  const BaynoooteChoiceContainer({
    this.icon,
    this.containerWidth = 40,
    this.containerHeight = 40,
    this.borderWidth = 3,
    this.onTap,
    super.key,
  });

  @override
  State<BaynoooteChoiceContainer> createState() =>
      _BaynoooteChoiceContainerState();
}

class _BaynoooteChoiceContainerState extends State<BaynoooteChoiceContainer> {
  final ValueNotifier<bool> isSelected = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected.value = !isSelected.value;
        HapticFeedback.selectionClick();
        if (isSelected.value) {
          widget.onTap?.call();
        }
      },
      child: SizedBox(
        height: widget.containerHeight,
        width: widget.containerWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: widget.containerHeight,
              width: widget.containerWidth,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(15, 0, 0, 0),
                    offset: Offset(0, 2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Center(),
            ),
            ValueListenableBuilder(
              valueListenable: isSelected,
              builder: (context, isSelect, _) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: Alignment.center,
                  transformAlignment: Alignment.center,
                  transform: Matrix4.diagonal3Values(
                    isSelect ? 0.8 : 1.0,
                    isSelect ? 0.8 : 1.0,
                    1.0,
                  ),
                  height: widget.containerHeight - widget.borderWidth,
                  width: widget.containerWidth - widget.borderWidth,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 255, 255, 255),
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
