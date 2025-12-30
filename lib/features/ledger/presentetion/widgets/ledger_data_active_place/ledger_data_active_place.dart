//依赖注入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

///组件
import 'ledger_data_placeholder.dart';

///该组件是数据活动区域的最外层容器
class LedgerDataActivePlace extends StatelessWidget {
  const LedgerDataActivePlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: LedgerDataPlaceholder());
  }
}
