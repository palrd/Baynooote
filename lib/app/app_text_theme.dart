import 'package:baynooote/app/app_theme.dart';
import 'package:baynooote/shared/extensions/double_extenson.dart';
import 'package:flutter/material.dart';

///一个专门用于字号设置的类
class AppTextTheme {
  ///最大的标题设置
  static TextStyle get displayLarge => TextStyle(
    fontSize: AppTheme.biggestTitle.sp,
    color: AppTheme.titleColor,
    fontWeight: FontWeight.bold,

    shadows: [
      BoxShadow(
        color: Colors.black.withAlpha(0x4C),
        offset: Offset(5, 0),
        blurRadius: 12,
      ),
    ],
  );

  ///二级标题的设置
  static TextStyle get titleMedium => TextStyle(
    fontSize: AppTheme.secondaryTitle.sp,
    color: AppTheme.titleColor,
    fontWeight: FontWeight.bold,
    shadows: [
      BoxShadow(
        color: Colors.black.withAlpha(0x4C),
        offset: Offset(0, 2),
        blurRadius: 12,
      ),
    ],
  );

  ///三级标题的设置
  static TextStyle get titleLarge => TextStyle(
    fontSize: AppTheme.thridTitle.sp,
    color: AppTheme.secondaryTitleColor,
  );

  ///时间文字大小
  static TextStyle get bodyMedium =>
      TextStyle(fontSize: AppTheme.timeText.sp, color: AppTheme.timeColor);

  ///常规文字大小
  static TextStyle get bodySmall => TextStyle(
    fontSize: AppTheme.normalText.sp,
    color: AppTheme.subtitleTextColor,
  );
}
