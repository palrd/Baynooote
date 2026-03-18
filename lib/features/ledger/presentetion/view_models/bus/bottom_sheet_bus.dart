import 'package:flutter/widgets.dart';

enum BottomSheetType {
  none,
  typeChoice,
  numberKeyBoard,
  recordDetail,
  datePicker,
  connectRecord,
  diyType,
  caculate,
  bottomNav,
}

class BottomSheetBus {
  static final ValueNotifier<BottomSheetType> bottomSheetNow = ValueNotifier(
    BottomSheetType.none,
  );

  ///此方法用于关闭或开启弹窗
  static void setSheetValue(BottomSheetType type) {
    bottomSheetNow.value = bottomSheetNow.value == type
        ? BottomSheetType.none
        : type;
  }
}
