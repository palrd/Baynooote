import 'package:flutter/material.dart'; // 只需要 Material 用于 ChangeNotifier

class RecordCollectionAmountViewModel extends ChangeNotifier {
  String _inputBuffer = "";

  // 对外展示的 Getter
  String get inputBuffer {
    if (_inputBuffer.isEmpty) {
      return "0.00"; // 建议显示两位小数占位，更像记账软件
    }
    return _inputBuffer;
  }

  

  /// 处理数字 0-9 和 .
  void handleNumber(String char) {
    // --- 1. 处理小数点 ---
    if (char == ".") {
      if (_inputBuffer.contains(".")) {
        return; // 已经有点了，忽略
      }
      if (_inputBuffer.isEmpty) {
        _inputBuffer = "0"; // 空状态输入点，变成 0.
        notifyListeners();
        // return;
      }
    }

    // --- 2. 处理小数位限制 (最多两位) ---
    if (_inputBuffer.contains(".")) {
      final parts = _inputBuffer.split(".");
      // parts[0]是整数，parts[1]是小数
      // 注意：split("12.") 结果是 ["12", ""]，parts.length 是 2
      if (parts.length > 1 && parts[1].length >= 2) {
        return; // 小数位满了
      }
    }

    // --- 3. 处理整数位限制 (最多6位) ---
    // 【关键修复】只有当输入的不是小数点，且当前没有小数点时，才检查整数长度
    if (char != "." && !_inputBuffer.contains(".")) {
      if (_inputBuffer.length >= 6) {
        return; // 整数位满了
      }
    }

    // --- 4. 拼接逻辑 ---
    // 【关键修复】处理 "0" 开头的问题
    // 如果当前是 "0" 且输入的不是 "."，比如输入 "5"，应该变成 "5" 而不是 "05"
    if (_inputBuffer == "0" && char != ".") {
      _inputBuffer = char;
    } else {
      _inputBuffer += char;
    }

    notifyListeners();
  }

  void delete() {
    if (_inputBuffer.isEmpty) return;

    if (_inputBuffer.length == 1) {
      _inputBuffer = "";
    } else {
      _inputBuffer = _inputBuffer.substring(0, _inputBuffer.length - 1);
    }
    notifyListeners();
  }

  // 建议加一个清空方法，长按删除键时调用
  void clear() {
    _inputBuffer = "";
    notifyListeners();
  }
}
