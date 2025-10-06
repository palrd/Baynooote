
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_quick_input/type_choice_item.dart';
import 'package:flutter/material.dart';

///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

////类型选择条
class TypeChoiceBar extends StatelessWidget {
  const TypeChoiceBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.sw,
      padding: EdgeInsets.only(
        left: 15.sw,
        top: 8.sw,
        bottom: 8.sw,
        right: 15.sw,
      ),
      child: Container(
        child: Row(children: [typeWithTime(), typeChoiceScrollBar()]),
      ),
    );
  }
}

///按照时间推荐类型
class typeWithTime extends StatelessWidget {
  const typeWithTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.sw,
      height: 30.sw,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.sw)),
      child: Icon(
        Icons.access_time,
        size: 20.sw,
        fontWeight: FontWeight.w500,
        color: AppTheme.typeIconColor,
      ),
    );
  }
}

///具体类型选择
class typeChoiceScrollBar extends StatelessWidget {
  const typeChoiceScrollBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.sw),
        height: 30.sw,
        margin: EdgeInsets.only(left: 5.sw),
        decoration: BoxDecoration(
          color: const Color.fromARGB(30, 197, 201, 204),
          borderRadius: BorderRadius.circular(20.sw),
        ),
        clipBehavior: Clip.hardEdge,
        child: horizontalRow(),
      ),
    );
  }

  Widget horizontalRow() {
    final List<Widget> items = [
      TypeChoiceItem(iconName: Icons.ac_unit_outlined),
      TypeChoiceItem(iconName: Icons.accessible_outlined),
      TypeChoiceItem(iconName: Icons.work_rounded),
      TypeChoiceItem(iconName: Icons.account_circle_sharp),
      TypeChoiceItem(iconName: Icons.adb_outlined),
    ];
    ///TODO 将来需要变成可横向滚动
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }
}
