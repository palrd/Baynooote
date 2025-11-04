///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/money_counter_view_model.dart';

///记账金额输入区
class MoneyCountInput extends StatelessWidget {
  const MoneyCountInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.sw, bottom: 8.sw, right: 15.sw),
      height: 50.sw,
      child: Container(
        height: 40.sw,
        padding: EdgeInsets.only(left: 25.sw, right: 20.sw),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(20.sw),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(9, 0, 0, 0),
              offset: Offset(0, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(child: MoneyInputField()),
      ),
    );
  }
}

///内容变动，所以单独抽出
////金额输入
class MoneyInputField extends StatefulWidget {
  @override
  State<MoneyInputField> createState() => _MoneyInputFieldState();
}

class _MoneyInputFieldState extends State<MoneyInputField> {
  @override
  Widget build(BuildContext context) {
    return Selector<MoneyCounterViewModel, double>(
      builder: (_, moneyNumber, _) {
        return TextFormField(
          showCursor: true,
          cursorColor: Colors.black,
          cursorRadius: Radius.circular(20),
          onTap: () {
            final vm = context.read<ConfirmButtonState>();
            vm.changeState(2);
          },
          style: TextStyle(fontWeight: FontWeight.w800),
          decoration: InputDecoration(
            hintText: "输入记账金额",
            hintStyle: AppTextTheme.titleLarge,
            border: InputBorder.none,
            isCollapsed: true,
            contentPadding: EdgeInsets.zero,
          ),
          maxLines: 1,
        );
      },
      selector: (_, vm) => vm.moneyNumber,
    );
  }
}
