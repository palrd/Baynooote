import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/money_counter_view_model.dart';

///该组件用于记录记账金额和货币类型
class MoneyCounter extends StatefulWidget {
  final String moneyType;
  late double? moneyCounte;
  final double fontsize;
  final double margin;
  final double scale;
  MoneyCounter({
    this.moneyType = "\$",
    this.moneyCounte,
    this.fontsize = 35,
    this.margin = 5,
    this.scale = 1.0,
    super.key,
  });

  @override
  State<MoneyCounter> createState() => _MoneyCounterState();
}

class _MoneyCounterState extends State<MoneyCounter> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: 50.sw * widget.scale,
      margin: EdgeInsets.only(left: widget.margin.sw),
      child: Row(
        children: [
          _moneyUnit(),
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

  Widget _moneyUnit() {
    return Container(
      alignment: Alignment.center,
      width: 27.sw,
      child: Text(
        widget.moneyType,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: widget.fontsize.sw,
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
    );
  }

  Widget _moneyNumber() {
    return Selector<MoneyCounterViewModel, double>(
      builder: (_, moneyNumber, _) {
        _controller.text = moneyNumber.toString();
        final vm2 = context.read<MoneyCounterViewModel>();
        if (moneyNumber != 0) {
          return TextField(
            controller: _controller,
            onChanged: (value) {
              final parsed = double.tryParse(value);
              if (parsed != null) {
                vm2.changeMoneyNumber(parsed);
              } else {
                vm2.changeMoneyNumber(0.0);
              }
            },
            showCursor: true,
            cursorColor: Colors.white,
            cursorRadius: Radius.circular(20),
            decoration: InputDecoration(
              border: InputBorder.none,
              isCollapsed: true,
              contentPadding: EdgeInsets.zero,
            ),
            maxLines: 1,
            style: TextStyle(
              overflow: TextOverflow.clip,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: widget.fontsize.sw,
              height: 1.0,
              shadows: [
                BoxShadow(
                  color: const Color.fromARGB(26, 0, 0, 0),
                  offset: Offset(3, 4),
                  blurRadius: 5,
                ),
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
      selector: (_, vm) => vm.moneyNumber,
    );
  }
}
