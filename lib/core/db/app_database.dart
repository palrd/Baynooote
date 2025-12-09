import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart'; // 核心：加载绑定版 SQLite

part 'app_database.g.dart';

@DriftDatabase(include: {'tables.drift'})
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // 1. 获取 App 文档目录
    final dbFolder = await getApplicationDocumentsDirectory();
    // 2. 拼接数据库文件名
    final file = File(p.join(dbFolder.path, 'my_ledger.sqlite'));

    // 3. (可选) 针对 Android 的一些补丁，防止崩溃
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // 4. 获取临时目录 (SQLite 需要它来做缓存)
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    // 5. 打开数据库 (NativeDatabase 使用 FFI 高性能连接)
    return NativeDatabase.createInBackground(file);
  });
}
