import 'dart:ui';

import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/money_counter_view_model.dart';

///该组件用于展示当前金额的程度
class NumberLevelLight extends StatelessWidget {
  final double width;
  final double height;
  final double lightWidth;
  final double lightHeight;
  final bool isDetail;
  final Color bgColor;
  final int confirmIndex;
  const NumberLevelLight({
    this.width = 0,
    this.height = 0,
    this.lightHeight = 0,
    this.lightWidth = 0,
    this.isDetail = false,
    this.bgColor = Colors.white,
    this.confirmIndex = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: isDetail ? width : 40,
          height: isDetail ? height : 15,
          padding: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: isDetail ? bgColor : const Color.fromARGB(60, 247, 247, 247),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              isDetail
                  ? _sigalLightWithDetailMode(Colors.green, 1, confirmIndex)
                  : _sigalLight(Colors.green, 1),
              isDetail
                  ? _sigalLightWithDetailMode(Colors.yellow, 2, confirmIndex)
                  : _sigalLight(Colors.yellow, 2),
              isDetail
                  ? _sigalLightWithDetailMode(Colors.red, 3, confirmIndex)
                  : _sigalLight(Colors.red, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sigalLight(Color color, int now) {
    return Selector<MoneyCounterViewModel, int>(
      builder: (_, index, _) {
        if (index == 4) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: isDetail ? lightWidth : 7,
            height: isDetail ? lightHeight : 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Center(),
          );
        } else {
          return AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: isDetail ? lightWidth : 7,
            height: isDetail ? lightHeight : 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: now <= index ? color : AppTheme.unChooseColor,
            ),
            child: Center(),
          );
        }
      },
      selector: (_, vm) => vm.index,
    );
  }

  Widget _sigalLightWithDetailMode(Color color, int now, int index) {
    if (index == 4) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: isDetail ? lightWidth : 7,
        height: isDetail ? lightHeight : 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        child: Center(),
      );
    } else {
      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: isDetail ? lightWidth : 7,
        height: isDetail ? lightHeight : 7,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: now <= index ? color : AppTheme.unChooseColor,
        ),
        child: Center(),
      );
    }
  }
}
