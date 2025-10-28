import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/money_counter_view_model.dart';

///该组件用于记录记账金额和货币类型
class MoneyCounter extends StatelessWidget {
  final String moneyType;
  late double? moneyCounte;
  final double fontsize;
  final double margin;
  MoneyCounter({
    this.moneyType = "\$",
    this.moneyCounte,
    this.fontsize = 35,
    this.margin = 5,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin.sw),
      height: 55.sw,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 27.sw,
            child: Text(
              moneyType,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontsize.sw,
                height: 1.0,
                shadows: [
                  BoxShadow(
                    color: const Color.fromARGB(26, 0, 0, 0),
                    offset: Offset(3, 4),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              width: 35.sw,
              child: _moneyNumber(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _moneyNumber() {
    return Selector<MoneyCounterViewModel, double>(
      builder: (_, moneyNumber, _) {
        if (moneyNumber != 0) {
          return Text(
            "$moneyNumber",
            style: TextStyle(
              overflow: TextOverflow.clip,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontsize.sw,
              height: 1.0,
              shadows: [
                BoxShadow(
                  color: const Color.fromARGB(26, 0, 0, 0),
                  offset: Offset(3, 4),
                  blurRadius: 5,
                ),
              ],
            ),
            maxLines: 1,
          );
        } else {
          return SizedBox.shrink();
        }
      },
      selector: (_, vm) => vm.moneyNumber,
    );
  }
}
