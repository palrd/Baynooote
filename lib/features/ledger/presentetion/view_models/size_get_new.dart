import 'package:flutter/widgets.dart';

class SizeGetNew extends ChangeNotifier {
  ///用来检测到size不为0时重构动画等需要依赖初始化的widget
  bool _isNewSize = false;

  bool get isNewSize => _isNewSize;

  void setSize(Size newSize) {
    if (newSize.width != 0) {
      print("我拿到了！：：：：$newSize");

      _isNewSize = true;
      notifyListeners();
    } else {
      print("size还是0$newSize");
    }
  }
}
