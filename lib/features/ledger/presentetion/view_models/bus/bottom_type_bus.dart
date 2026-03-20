import 'package:baynooote/features/ledger/di/ledger_module.dart';

class BottomTypeBus {
  static final ValueNotifier<int> selectedIndex = ValueNotifier(-1);

  static void setSlectedIndex(int index) {
    selectedIndex.value == index
        ? selectedIndex.value = -1
        : selectedIndex.value = index;
  }
}
