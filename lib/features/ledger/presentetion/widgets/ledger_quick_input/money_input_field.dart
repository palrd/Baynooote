
///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

///记账金额输入区
class moneyCountInput extends StatelessWidget {
  const moneyCountInput({super.key});

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
  @override
  Widget build(BuildContext context) {
    return TextField(
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
