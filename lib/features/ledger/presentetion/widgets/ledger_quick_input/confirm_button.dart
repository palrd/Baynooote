
import 'package:flutter/material.dart';

///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

///右侧的状态确认按钮
class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.all(15.sw),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.iconBgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(0x1A),
                  offset: Offset(0, 2),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.done,
                color: AppTheme.iconColor,
                size: 42.sw,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}