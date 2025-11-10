import 'package:flutter/material.dart';

///用于储存状态种类
class LedgerChoiceTypeItems {
  ///对外暴露
  static final List<IconData> icons = [
    Icons.access_time,
    Icons.lunch_dining_outlined,
    Icons.lunch_dining_outlined,
    Icons.lunch_dining_outlined,
    Icons.lunch_dining_outlined,
    Icons.lunch_dining_outlined,
  ];

  static final List<Color> iconColorsaBegin = [
    Color.fromRGBO(181, 198, 196, 0.698),
    Color.fromRGBO(184, 181, 198, 0.7),
    Color.fromRGBO(163, 181, 199, 0.75),
    Color.fromRGBO(212, 184, 166, 0.7),
    Color.fromRGBO(165, 181, 169, 0.75),
    Color.fromRGBO(200, 169, 181, 0.7),
  ];

  static final List<Color> iconColorsaEnd = [
    Color.fromRGBO(207, 217, 227, 0.6),
    Color.fromRGBO(211, 207, 227, 0.6),
    Color.fromRGBO(201, 213, 226, 0.65),
    Color.fromRGBO(232, 213, 200, 0.6),
    Color.fromRGBO(201, 210, 203, 0.65),
    Color.fromRGBO(224, 206, 214, 0.6),
  ];

  static final List<Color> showdowColorsa = [
    Color.fromRGBO(211, 207, 227, 0.9),
    Color.fromRGBO(211, 207, 227, 0.9),
    Color.fromRGBO(201, 213, 226, 0.9),
    Color.fromRGBO(232, 213, 200, 0.9),
    Color.fromRGBO(201, 210, 203, 0.9),
    Color.fromRGBO(224, 206, 214, 0.9),
  ];

  static final List<String> lottieJsons = [
    "assets/lottie/Star.json",
    "assets/lottie/Sleeping.json",
    "assets/lottie/Conv.json",
    "assets/lottie/dizzy.json",
    "assets/lottie/Idea.json",
    "assets/lottie/Bunny.json",
  ];

  static final List<String> typeNames = [
    "美食",
    "娱乐",
    "运动",
    "艺术",
    "旅行",
    "日常",
  ];
}
