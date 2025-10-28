import 'dart:ui';

import 'package:baynooote/features/ledger/di/ledger_module.dart';

///该组件用于展示正在记录的账单类型
class TypenameShow extends StatelessWidget {
  const TypenameShow({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.sw),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: EdgeInsets.all(1.sw),
          alignment: Alignment.center,
          width: 36.sw,
          height: 20.sw,
          decoration: BoxDecoration(
            color: const Color.fromARGB(100, 247, 247, 247),
            border: Border(bottom: BorderSide(color: Colors.white30)),
          ),
          child: Selector<QuickAnimationActiveState, int>(
            builder: (_, index, _) {
              return Text(
                LedgerChoiceTypeItems.typeNames[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sw,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
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
    );
  }
}
