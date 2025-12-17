///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

///组件导入

import 'quick_input_card.dart';

class LedgerQuickInput extends StatelessWidget {
  const LedgerQuickInput({super.key});

  @override
  Widget build(BuildContext context) {
    print("LedgerQuickInput重构！");

    ///最外层container用于设定上外边距
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: QuickInputCard(),
    );
  }
}
