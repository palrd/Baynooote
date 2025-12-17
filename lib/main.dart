import 'package:baynooote/core/db/app_database.dart';
import 'package:baynooote/features/ledger/data/repository/baynooote_repo.dart';
import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_record_view_model.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/money_counter_view_model.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/record_collection/record_collection_amount.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/record_collection/record_collection_record_type.dart';
import 'package:baynooote/shared/widgets/baynooote.dart';

import 'package:rive/rive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RiveFile.initialize();
  final db = AppDatabase();
  final repo = BaynoooteRepo(db);

  runApp(
    MultiProvider(
      providers: [
        ///数据库连接
        Provider.value(value: db),

        ///注入仓库
        Provider.value(value: repo),
        ChangeNotifierProvider(create: (ctx) => DataActivePlaceViewModel()),
        ChangeNotifierProvider(create: (ctx) => QuickAnimationActiveState()),
        ChangeNotifierProvider(create: (ctx) => ConfirmButtonState()),
        ChangeNotifierProvider(create: (ctx) => MoneyCounterViewModel()),
        ChangeNotifierProvider(create: (ctx) => ConfirmRecordViewModel(repo)),
        ChangeNotifierProvider(create: (ctx) => RecordCompletedViewModel()),
        ChangeNotifierProvider(create: (ctx) => RecordCollectionViewModel()),
        ChangeNotifierProvider(create: (ctx) => RecordCollectionAmountViewModel()),
      ],
      child: Baynooote(),
    ),
  );
}
