import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/money_counter_view_model.dart';

///该组件用于记录记账金额和货币类型
class MoneyCounter extends StatefulWidget {
  final String moneyType;
  late double? moneyCounte;
  final double fontsize;
  final double margin;
  final double scale;
  final bool isSmall;
  MoneyCounter({
    this.moneyType = "\$",
    this.moneyCounte,
    this.fontsize = 35,
    this.margin = 5,
    this.scale = 1.0,
    this.isSmall = false,
    super.key,
  });

  @override
  State<MoneyCounter> createState() => _MoneyCounterState();
}

class _MoneyCounterState extends State<MoneyCounter> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final vm = context.read<MoneyCounterViewModel>();
    _controller.text = vm.moneyNumber == 0.0 ? '' : vm.moneyNumber.toString();
    if (!widget.isSmall) {
      if (!vm.alreadFocused) {
        Future.delayed(const Duration(seconds: 1), () {
          _focusNode.requestFocus();
          vm.resetFocus();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.sw * widget.scale,
      margin: EdgeInsets.only(left: widget.margin.sw),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: widget.isSmall
                  ? Alignment.center
                  : Alignment.centerLeft,
              width: 35.sw,
              child: _moneyNumber(),
            ),
          ),
        ],
      ),
    );
  }

  ///弃用
  @Deprecated("该方法已被弃用")
  Widget _moneyUnit() {
    return Container(
      width: widget.isSmall ? 16.sw : 27.sw,
      alignment: Alignment.center,
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
        strutStyle: StrutStyle(
          forceStrutHeight: true,
          height: 1.0,
          fontSize: widget.fontsize.sw,
        ),
      ),
    );
  }

  Widget _moneyNumber() {
    final vm2 = context.read<MoneyCounterViewModel>();
    final buttonVM = context.read<ConfirmButtonState>();
    if (vm2.shouldSubmit) {
      ///延迟一秒再进行清空
      Future.delayed(const Duration(seconds: 1), () {
        _controller.clear();
        vm2.changeMoneyNumber(0.0);
        vm2.resetSubmit();
        vm2.resetFocus();
      });
    }
    return Selector<MoneyCounterViewModel, double>(
      builder: (_, moneyNumber, _) {
        final sizeScale = moneyNumber > 999 ? 0.8 : 1.0;

        return Container(
          alignment: Alignment.centerLeft,
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              final parsed = double.tryParse(value);
              if (parsed != null) {
                vm2.changeMoneyNumber(parsed);
              } else {
                vm2.changeMoneyNumber(0.0);
              }
              if (buttonVM.inputState == 2) {
                buttonVM.changeState(3);
              }
            },
            onSubmitted: (_) {
              if (buttonVM.inputState == 3) {
                buttonVM.changeState(4);
              }
              Future.delayed(const Duration(seconds: 1), () {
                _controller.clear();
                vm2.changeMoneyNumber(0.0);
                vm2.resetSubmit();
              });
            },
            showCursor: true,
            cursorColor: Colors.white,
            cursorRadius: Radius.circular(20),
            cursorWidth: 3.sw,
            cursorHeight: widget.fontsize.sw,
            cursorOpacityAnimates: true,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(bottom: 3.sw, top: 3.sw),
              isCollapsed: true,
            ),
            maxLines: 1,
            style: TextStyle(
              height: 1.0,
              overflow: TextOverflow.clip,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: widget.fontsize.sw * sizeScale,
              shadows: [
                BoxShadow(
                  color: const Color.fromARGB(26, 0, 0, 0),
                  offset: Offset(3, 4),
                  blurRadius: 5,
                ),
              ],
            ),
            strutStyle: StrutStyle(
              forceStrutHeight: true,
              height: 1.0,
              fontSize: widget.fontsize.sw * sizeScale,
            ),
          ),
        );
      },
      selector: (_, vm) => vm.moneyNumber,
    );
  }
}
