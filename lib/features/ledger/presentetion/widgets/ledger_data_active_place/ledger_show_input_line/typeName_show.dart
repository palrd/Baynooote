import 'dart:ui';

import 'package:baynooote/features/ledger/di/ledger_module.dart';

///该组件用于展示正在记录的账单类型
class TypenameShow extends StatelessWidget {
  final double scale;
  final Color textColor;
  final Color bgColor;
  final double witdh;
  final double height;
  final bool isCompleted;
  final bool useBlur;
  final bool useBold;
  final double fontSize;
  final int text;
  const TypenameShow({
    this.scale = 1.0,
    this.textColor = Colors.white,
    this.bgColor = const Color.fromARGB(100, 247, 247, 247),
    this.witdh = 0,
    this.height = 0,
    this.isCompleted = false,
    this.useBlur = true,
    this.useBold = false,
    this.fontSize = 12,
    this.text = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isCompleted ? buildWithComplete() : buildWithNoComplete();
  }

  Widget buildWithComplete() {
    return Container(
      alignment: Alignment.center,
      width: isCompleted ? witdh : 36.sw,
      height: isCompleted ? height : 20.sw * scale,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.sw),
      ),
      child: Text(
        LedgerChoiceTypeItems.typeNames[text],
        style: TextStyle(
          color: textColor,
          fontSize: isCompleted ? fontSize : 14.sw,
          fontWeight: useBold ? FontWeight.w900 : FontWeight.bold,
          height: 1.0,
          shadows: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 2),
              blurRadius: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWithNoComplete() {
    return useBlur
        ? ClipRRect(
            borderRadius: BorderRadius.circular(20.sw),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                alignment: Alignment.center,
                width: isCompleted ? witdh : 36.sw,
                height: isCompleted ? height : 20.sw * scale,
                decoration: BoxDecoration(color: bgColor),
                child: Selector<QuickAnimationActiveState, int>(
                  builder: (_, index, _) {
                    return Text(
                      LedgerChoiceTypeItems.typeNames[index],
                      style: TextStyle(
                        color: textColor,
                        fontSize: isCompleted ? fontSize : 14.sw,
                        fontWeight: useBold ? FontWeight.w900 : FontWeight.bold,
                        height: 1.0,
                        shadows: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(1, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    );
                  },
                  selector: (_, vm) => vm.selectedIndexActiveState,
                ),
              ),
            ),
          )
        : Container(
            alignment: Alignment.center,
            width: isCompleted ? witdh : 36.sw,
            height: isCompleted ? height : 20.sw * scale,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20.sw),
            ),
            child: Selector<QuickAnimationActiveState, int>(
              builder: (_, index, _) {
                return Text(
                  LedgerChoiceTypeItems.typeNames[index],
                  style: TextStyle(
                    color: textColor,
                    fontSize: isCompleted ? fontSize : 14.sw,
                    fontWeight: useBold ? FontWeight.w900 : FontWeight.bold,
                    height: 1.0,
                    shadows: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(1, 2),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                );
              },
              selector: (_, vm) => vm.selectedIndexActiveState,
            ),
          );
  }
}
