import 'dart:ui';

import 'package:baynooote/app/app_text_theme.dart';
import 'package:baynooote/app/app_theme.dart';
import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/shared/extensions/int_extension.dart';
import 'package:flutter/material.dart';

class LedgerHeader extends StatelessWidget {
  const LedgerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.only(
        bottomLeft: Radius.circular(20.sw),
        bottomRight: Radius.circular(20.sw),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: 90.sw,
          color: Colors.transparent,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20.sw, right: 20.sw, top: 20.sw),
          child: Text(
            "Baynooote",
            style: TextStyle(
              fontSize: AppTheme.biggestTitle.sw,
              color: AppTheme.titleColor,
              fontWeight: FontWeight.bold,
              fontFamily: "Qinfen",
              shadows: [
                BoxShadow(
                  color: Colors.black.withAlpha(0x4C),
                  offset: Offset(5, 0),
                  blurRadius: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
