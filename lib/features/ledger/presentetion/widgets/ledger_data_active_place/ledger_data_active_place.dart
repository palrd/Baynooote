//依赖注入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

///组件
import 'ledger_data_placeholder.dart';

///该组件是数据活动区域的最外层容器
class LedgerDataActivePlace extends StatelessWidget {
  const LedgerDataActivePlace({super.key});

  @override
  Widget build(BuildContext context) {
    print("LedgerDataActivePlace重构！");

    return Expanded(
      child: Container(
        // color: Colors.amber,
        child: Stack(
          children: [
            Visibility(visible: true, child: LedgerDataPlaceholder()),
            // _list(),
          ],
        ),
      ),
    );
  }

  Widget _list() {
    return FractionallySizedBox(
      widthFactor: 1.0,
      heightFactor: 1.0,
      child: Container(
        color: Colors.red,
        padding: EdgeInsets.only(top: 40.sw),
        child: Center(
          child: Container(color: Colors.amber, child: Center()),
        ),
      ),
    );
  }
}
