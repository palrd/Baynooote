import 'dart:ui';

import 'package:baynooote/features/ledger/di/ledger_module.dart';

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
              _sigalLight(Colors.green),
              _sigalLight(Colors.yellow),
              _sigalLight(Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sigalLight(Color color) {
    return Container(
      width: 7.sw,
      height: 7.sw,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(),
    );
  }
}
