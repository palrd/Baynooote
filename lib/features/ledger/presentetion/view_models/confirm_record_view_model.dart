import 'package:baynooote/core/util/money_util.dart';
import 'package:baynooote/features/ledger/data/dtos/black_param.dart';
import 'package:baynooote/features/ledger/data/repository/baynooote_repo.dart';
import 'package:flutter/material.dart';


///这个VM用来建立数据库和UI之间的交互
///提供了数据的增删改查方法
class ConfirmRecordViewModel extends ChangeNotifier {
  final BaynoooteRepo baynoooteRepo;

  ///持有仓库
  ConfirmRecordViewModel(this.baynoooteRepo);
  bool _isSaved = false;

  bool get isSaved => _isSaved;

  Future<void> submitRecord({
    required double amountDouble,

    required int categoryId,

    required int recordType,

    DateTime? date,

    String? title,

    List<BlockParam>? blocks, // 详情块 (图片/文字/视频)
  }) async {
    final amount = MoneyUtil.changeYuanToFen(amountDouble);
    print(amount);
    final time = date ?? DateTime.now();

    try {
      await baynoooteRepo.createSigalLedger(
        amount: amount,
        recordType: recordType,
        time: time,
        categoryId: categoryId,
      );
      debugPrint("保存成功");
      // _isSaved = true;
      // notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("保存失败");
    }
  }

  Future<void> showLedgers() async {
    // 1. 获取数据 (等待流的第一帧)
    final list = await baynoooteRepo.watchLedgers().first;

    // 2. 先判断有没有数据
    if (list.isEmpty) {
      debugPrint("=== 没有查到数据 (请检查是否插入了分类数据) ===");
      return;
    }

    debugPrint("=== 开始打印 ${list.length} 条账单 ===");

    // 3. 使用 for-in 循环遍历每一条
    for (var item in list) {
      // item 的类型是 GetAllLedgersWithCategoryResult
      // 你可以打印你想看的任何字段
      debugPrint(
        "ID: ${item.id} | 金额: ${item.amount} | 分类: ${item.categoryName} | 时间: ${item.recordTime}",
      );
    }

    debugPrint("=== 打印结束 ===");
  }

  Future<void> seedDatabase() async {
    await baynoooteRepo.initCategories();
  }

  Future<void> deleteAll() async {
    await baynoooteRepo.factoryReset();
  }
}
