import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/clip_line.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_detail_record.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/show_animation_icon.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/typeName_show.dart';

class LedgerShowInputLine extends StatelessWidget {
  const LedgerShowInputLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
      child: Row(children: [_leftWrapper(), _rightWrapper()]),
    );
  }

  ///右侧包裹
  Widget _rightWrapper() {
    return Container(
      width: 95,
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          ShowAnimationIcon(),
          Container(margin: EdgeInsets.only(top: 10), child: TypenameShow()),
        ],
      ),
    );
  }

  ///左侧包裹
  Widget _leftWrapper() {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Expanded(flex: 3, child: _topWrapper()),
            Expanded(flex: 7, child: _lineDESCWrapper()), // 自动扩展
          ],
        ),
      ),
    );
  }

  ///因为要自动扩展高度
  ///所以用一个容器包裹线条和记录器
  Widget _lineDESCWrapper() {
    return Container(
      // margin: EdgeInsets.only(top: 3),
      child: Column(
        children: [
          ClipLine(),
          Expanded(child: LedgerDetailRecord()),
        ],
      ),
    );
  }

  ///numberT和金额量包裹
  Widget _topWrapper() {
    final double money = 2344.23;
    return Container(
      alignment: Alignment.centerLeft,
      height: 40,
      child: Text(
        "\$$money",
        maxLines: 1,
        style: TextStyle(
          overflow: TextOverflow.clip,
          height: 1.0,
          fontFamily: 'Qinfen',
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ).addTapFeel();
  }
}
