
///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

///组件导入
import 'change_card_state.dart';
import 'quick_input_card.dart';

class LedgerQuickInput extends StatelessWidget {
  const LedgerQuickInput({super.key});

  @override
  Widget build(BuildContext context) {
    ///最外层container用于设定上外边距
    return Container(
      margin: EdgeInsets.only(top: 100.sw),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [ChangeCardState(), QuickInputCard()],
      ),
    );
  }
}
