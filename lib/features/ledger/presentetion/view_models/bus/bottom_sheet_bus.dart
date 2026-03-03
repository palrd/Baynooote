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
}

class BottomSheetBus {
  static final ValueNotifier<BottomSheetType> bottomSheetNow = ValueNotifier(
    BottomSheetType.numberKeyBoard,
  );
}
