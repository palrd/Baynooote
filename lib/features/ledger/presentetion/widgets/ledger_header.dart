import 'dart:ui';

import 'package:baynooote/app/app_text_theme.dart';
import 'package:baynooote/shared/extensions/int_extension.dart';
import 'package:flutter/material.dart';

class LedgerHeader extends StatelessWidget {
  const LedgerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 80.sw,
          color: const Color.fromARGB(255, 255, 255, 255).withAlpha(33),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20.sw, right: 20.sw,top: 20.sw),
          child: Text(
            "Baynooote",
            style: AppTextTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}
