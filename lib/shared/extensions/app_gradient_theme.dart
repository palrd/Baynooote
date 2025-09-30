import 'package:flutter/material.dart';

/// 自定义的主题扩展，用来把 LinearGradient（渐变色）
/// 挂到 ThemeData 上，这样可以通过 Theme.of(context) 获取
class AppGradientTheme extends ThemeExtension<AppGradientTheme> {
  /// 保存一个背景渐变
  final LinearGradient backgroundGradient;

  /// 构造函数，必须传入背景渐变
  const AppGradientTheme({required this.backgroundGradient});

  /// copyWith 是 ThemeExtension 的标准方法
  /// 作用：在需要修改这个主题扩展时，返回一个新的实例
  /// 只有你传入的 backgroundGradient 会被替换，其他字段保持不变
  @override
  AppGradientTheme copyWith({LinearGradient? backgroundGradient}) {
    return AppGradientTheme(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
    );
  }

  /// lerp 是 ThemeExtension 的标准方法
  /// 作用：在两个主题之间平滑过渡时（比如切换明暗模式时），
  /// Flutter 会调用这个方法插值（lerp = linear interpolation）
  /// 这里我们调用 LinearGradient.lerp 来计算渐变的中间状态
  @override
  AppGradientTheme lerp(ThemeExtension<AppGradientTheme>? other, double t) {
    // 如果 other 不是 AppGradientTheme，就直接返回当前主题（不插值）
    if (other is! AppGradientTheme) return this;
    return AppGradientTheme(
      backgroundGradient:
          // 让两个渐变在 0~1 的区间内平滑过渡
          LinearGradient.lerp(backgroundGradient, other.backgroundGradient, t)!,
    );
  }
}
