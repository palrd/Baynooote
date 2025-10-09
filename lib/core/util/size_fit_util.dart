import 'package:flutter/material.dart';

class SizeFitUtil {
  //定义屏幕宽高
  static late double screenWidth;
  static late double screenHeight;
  static late double _scaleWidth;
  static late double _scaleHeight;
  //定义设计稿宽高
  static final double designWidth = 375.0;
  static final double designHeight = 812.0;

  //定义初始化方法
  static void init(Size size) {
    //通过mediaquery拿到屏幕宽度

    screenWidth = size.width;
    screenHeight = size.height;
    //计算缩放因子
    _scaleWidth = screenWidth / designWidth;
    _scaleHeight = screenHeight / designHeight;
    print("ww:$_scaleWidth");
  }

  //初始化之后提供静态方法，用于缩放
  //宽度缩放
  static double sw(double width) {
    return width * _scaleWidth;
  }

  //高度缩放
  static double sh(double height) {
    return height * _scaleHeight;
  }

  //字体缩放
  static double sp(double width) {
    return width * _scaleWidth;
  }
}
  