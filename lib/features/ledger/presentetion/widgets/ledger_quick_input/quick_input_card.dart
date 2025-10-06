import 'package:baynooote/features/ledger/presentetion/widgets/ledger_quick_input/type_choice_bar.dart';
import 'package:flutter/material.dart';

///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

////组件导入
import 'money_input_field.dart';

import 'confirm_button.dart';

////卡片容器
class QuickInputCard extends StatelessWidget {
  const QuickInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.sw),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(0x4C),
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 10.sw),
      height: 100.sw,
      ///在卡片内部首先分为左右两部分
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [inputSection(), ConfirmButton()],
      ),
    );
  }
}

////左侧的记账信息输入区域
class inputSection extends StatelessWidget {
  const inputSection({super.key});

  @override
  Widget build(BuildContext context) {
    ///因为要分左右区域所以使用Expanded
    return Expanded(
      flex: 7,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        ///为左侧的上下两层写 Widget
        children: [TypeChoiceBar(), moneyCountInput()],
      ),
    );
  }
}

////记账金额输入区
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
              color: Colors.black.withAlpha(0x1A),
              offset: Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(child: MoneyInputField()),
      ),
    );
  }
}
