import 'dart:ui';

import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/money_counter_view_model.dart';

///该组件用于展示当前金额的程度
class NumberLevelLight extends StatelessWidget {
  const NumberLevelLight({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.sw),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: 36.sw,
          height: 15.sw,
          padding: EdgeInsets.symmetric(horizontal: 2.sw),
          decoration: BoxDecoration(
            color: const Color.fromARGB(60, 247, 247, 247),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _sigalLight(Colors.green, 1),
              _sigalLight(Colors.yellow, 2),
              _sigalLight(Colors.red, 3),
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
            width: 7.sw,
            height: 7.sw,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Center(),
          );
        } else {
          return AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: 7.sw,
            height: 7.sw,
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
}
