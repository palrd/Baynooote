import 'package:baynooote/core/db/app_database.dart';
import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/detail_record_view_model.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/money_counter_view_model.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/tip_content_view_model.dart';
import 'package:baynooote/shared/widgets/baynooote.dart';

import 'package:rive/rive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RiveFile.initialize();
  final db = AppDatabase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => StateCardViewModel()),
        ChangeNotifierProvider(create: (ctx) => DataActivePlaceViewModel()),
        ChangeNotifierProvider(create: (ctx) => QuickAnimationActiveState()),
        ChangeNotifierProvider(create: (ctx) => ConfirmButtonState()),
        ChangeNotifierProvider(create: (ctx) => MoneyCounterViewModel()),
        ChangeNotifierProvider(create: (ctx) => DetailRecordViewModel()),
        ChangeNotifierProvider(create: (ctx) => RecordCompletedViewModel()),
        ChangeNotifierProvider(
          create: (ctx) {
            final vm = ctx.read<ConfirmButtonState>();
            return TipContentViewModel(vm);
          },
        ),
        Provider<AppDatabase>(
          create: (ctx) => db,
          dispose: (context, db) => db.close(),
        ),
      ],
      child: Baynooote(),
    ),
  );
}
