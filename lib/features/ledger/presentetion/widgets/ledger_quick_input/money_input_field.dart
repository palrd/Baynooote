import 'package:flutter/material.dart';

///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

///内容变动，所以单独抽出
////金额输入
class MoneyInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "输入记账金额",
        hintStyle: AppTextTheme.titleLarge,
        border: InputBorder.none, /// 去掉下划线
        isCollapsed: true, /// ✅ 关键，去掉TextField默认的内部padding
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
