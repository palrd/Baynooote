///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';

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
        padding: EdgeInsets.only(left: 25.sw),
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
class MoneyInputField extends StatelessWidget {
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      showCursor: true,

      readOnly: true, // 禁止输入，不弹键盘
      onTap: () {
        final vm = context.read<ConfirmButtonState>();
        vm.changeState(2);
        FocusScope.of(context).requestFocus(_focusNode);
      },
      style: TextStyle(fontWeight: FontWeight.w800),
      decoration: InputDecoration(
        hintText: "输入记账金额",
        hintStyle: AppTextTheme.titleLarge,
        border: InputBorder.none,

        /// 去掉下划线
        isCollapsed: true,

        /// ✅ 关键，去掉TextField默认的内部padding
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
