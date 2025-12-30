import 'package:baynooote/core/db/app_database.dart';
import 'package:baynooote/features/ledger/data/dtos/black_param.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';

class BaynoooteRepo {
  final AppDatabase db;
  const BaynoooteRepo(this.db);

  ///增(Create)
  Future<void> createSigalLedger({
    required int amount,
    required int recordType,
    required DateTime time,
    required int categoryId,
    String? title,

    ///详细列表
    List<BlockParam>? blocks,
  }) async {
    ///在这个闭包操作中，要么全程成功，要么全部回滚
    await db.transaction(() async {
      ///1.插入主表
      final ledgerId = await db
          .into(db.ledgers)
          .insert(
            LedgersCompanion.insert(
              amount: amount,
              recordType: recordType,
              recordTime: time,
              categoryId: categoryId,
              title: Value(title),
            ),
          );

      debugPrint("id:$ledgerId");

      if (blocks != null && blocks.isNotEmpty) {
        List<LedgerBlocksCompanion> blockCompanions = [];
        for (int i = 0; i < blocks.length; i++) {
          ///获取索引
          final index = i;
          final item = blocks[i];

          blockCompanions.add(
            LedgerBlocksCompanion.insert(
              ledgerId: ledgerId,
              blockType: item.type,
              content: item.content,
              sortIndex: index,
              metaData: Value(item.metaData),
            ),
          );
        }

        await db.batch((batch) {
          batch.insertAll(db.ledgerBlocks, blockCompanions);
        });
      }
    });
  }

  ///查数据
  ///全部账单
  Stream<List<GetAllLedgersWithCategoryResult>> watchLedgers() {
    return db.getAllLedgersWithCategory().watch();
  }

  ///获取账单详细块
  Future<List<LedgerBlock>> getBlocks(int ledgerId) {
    return db.getBlocksByLedgerId(ledgerId).get();
  }

  ///操作类型表
  Future<int> createCategory(String name, String iconPath, int recordType) {
    return db
        .into(db.categories)
        .insert(
          CategoriesCompanion.insert(
            name: name,
            iconPath: iconPath,
            type: recordType,
            sortOrder: Value(0),
          ),
        );
  }

  ///获取所有类型
  Future<List<Category>> getAllCategories() {
    return (db.select(
      db.categories,
    )..orderBy([(t) => OrderingTerm(expression: t.sortOrder)])).get();
  }

  Future<void> initCategories() async {
    // 插入一个测试分类
    await db
        .into(db.categories)
        .insert(
          CategoriesCompanion.insert(
            name: "餐饮",
            iconPath: "assets/svgs/food.svg", // 随便填个路径
            type: 0, // 支出
            // id 是自增的，第一条插入的 id 默认就是 1
          ),
        );
  }

  Future<void> factoryReset() async {
    await db.transaction(() async {
      await db.delete(db.ledgerBlocks).go();
      await db.delete(db.categories).go();
      await db.delete(db.ledgers).go();

      await db.customStatement("DELETE FROM sqlite_sequence");
    });
  }
}
