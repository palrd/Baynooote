import 'package:baynooote/shared/extensions/app_gradient_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ///添加私有构造器防止被实例化
  AppTheme._();

  ///作为亮色的背景色

  ///0.1 1A
  ///0.2 33
  ///0.3 4C
  ///0.5 80
  ///0.9 99
  ////透明度更低的渐变色背景1
  static const LinearGradient primaryBackgroundGradient1 = LinearGradient(
    colors: [Color(0x4C539EF9), Color(0x3361C5F9)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  ////透明度更高的渐变色背景2
  static const LinearGradient primaryBackgroundGradient2 = LinearGradient(
    colors: [Color(0x80539EF9), Color(0x4C61C5F9)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  ///ICON的颜色

  ///icon的底色
  static const Color iconBgColor = Color(0xFF51AEE7);

  ///类型icon图标的颜色
  static const Color typeIconColor = Color(0xFF868686);

  ///主要icon图标的颜色
  static const Color iconColor = Color(0xFFFFFFFF);

  ///icon状态颜色：
  ///状态为：通过
  static const Color successColor = Color(0xFF48A938);

  ///状态为：不可选择
  static const Color unChooseColor = Color(0xFFC5C9CC);

  ///状态为： 认账通过
  static const Color confirmColor = Color(0xFF4B91CA);

  ///文字的颜色

  ///主标题文字色
  static const Color titleColor = Color(0xFF000000);

  ///placehol/次要展示文字颜色
  static const Color secondaryTitleColor = Color(0xFF97A0A7);

  ///单个item的leading标题颜色
  static const Color leadingTextColor = Color(0xFF434449);

  ///单个item的subtitle颜色
  static const Color subtitleTextColor = Color(0xFF8D8E90);

  ///单个item的时间颜色
  static const Color timeColor = Color(0xFF95999A);

  ///文字大小的定义
  ///最大标题（Baynooote）
  static final double biggestTitle = 28;

  ///第二级标题
  static final double secondaryTitle = 20;

  ///第三级标题
  static final double thridTitle = 16;

  ///时间文字大小
  static final double timeText = 13;

  ///常规文字大小
  static final double normalText = 11;

  ///定义主题数据
  static final ThemeData lightTheme = ThemeData(
    ///启用material3
    useMaterial3: true,

    ///让整体配色基于背景色生成
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFF61C5F9),
      brightness: Brightness.light,
    ),

    ///使用渐变色作为背景
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),

    /// 避免被纯色背景覆盖
    extensions: <ThemeExtension<dynamic>>[
      ////渐变色1
      AppGradientTheme(backgroundGradient: primaryBackgroundGradient1),
    ],

    ///使用方式
    /// decoration: BoxDecoration(
    ///   gradient: gradientTheme.backgroundGradient,
    /// ),

    ///icon的颜色
    iconTheme: IconThemeData(color: iconColor),
  );
}
