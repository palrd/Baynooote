import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/clip_line.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_detail_record.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/money_counter.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/number_level_light.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/show_animation_icon.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/typeName_show.dart';

class LedgerShowInputLine extends StatelessWidget {
  const LedgerShowInputLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20.sw,
        left: 20.sw,
        right: 17.5.sw,
        bottom: 20.sw,
      ),
      child: Row(children: [_leftWrapper(), _rightWrapper()]),
    );
  }

  ///右侧包裹
  Widget _rightWrapper() {
    return Expanded(flex: 3, child: Column(children: [ShowAnimationIcon()]));
  }

  ///左侧包裹
  Widget _leftWrapper() {
    return Expanded(
      flex: 7,
      child: Column(
        children: [
          _topWrapper(), // 高度随 topScale 改变
          _lineDESCWrapper(), // 自动扩展
        ],
      ),
    );
  }

  ///因为要自动扩展高度
  ///所以用一个容器包裹线条和记录器
  Widget _lineDESCWrapper() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 3.sw),
        child: Column(children: [ClipLine(), LedgerDetailRecord()]),
      ),
    );
  }

  ///numberT和金额量包裹
  Widget _topWrapper() {
    return Align(
      child: Row(
        children: [
          _numberTWrapper(),
          Expanded(child: MoneyCounter(fontsize: 45)),
        ],
      ),
    );
  }

  ///记账类型指示器和记账金额等级指示器包裹
  Widget _numberTWrapper() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 8.sw),
          TypenameShow(),
          SizedBox(height: 5.sw),
          NumberLevelLight(),
        ],
      ),
    );
  }
}
