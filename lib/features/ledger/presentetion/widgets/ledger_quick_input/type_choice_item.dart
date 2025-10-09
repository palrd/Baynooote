
import 'package:flutter/material.dart';

///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

///TODO 一个将有动画的IconWidget
////可选择的单个icon
class TypeChoiceItem extends StatefulWidget {
  late IconData iconName;
  TypeChoiceItem({required this.iconName});

  @override
  State<TypeChoiceItem> createState() => _TypeChoiceItemState();
}

class _TypeChoiceItemState extends State<TypeChoiceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(

      width: 30.sw,
      height: 30.sw,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(30.sw)),
      child: Icon(
        widget.iconName,
        fontWeight: FontWeight.w500,
        size: 20.sw,
        color: AppTheme.typeIconColor,
      ),
    );
  }
}
