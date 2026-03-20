import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/money_counter_view_model.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/record_collection/record_collection_amount.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/record_collection/record_collection_record_type.dart';
import 'package:baynooote/shared/widgets/baynooote.dart';

import 'package:rive/rive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RiveFile.initialize();

  runApp(
    MultiProvider(
      providers: [
        ///注入仓库
        ChangeNotifierProvider(create: (ctx) => DataActivePlaceViewModel()),
        ChangeNotifierProvider(create: (ctx) => QuickAnimationActiveState()),
        ChangeNotifierProvider(create: (ctx) => ConfirmButtonState()),
        ChangeNotifierProvider(create: (ctx) => MoneyCounterViewModel()),
        ChangeNotifierProvider(create: (ctx) => RecordCompletedViewModel()),
        ChangeNotifierProvider(create: (ctx) => RecordCollectionViewModel()),
        ChangeNotifierProvider(create: (ctx) => RecordCollectionAmountViewModel()),
      ],
      child: Baynooote(),
    ),
  );
}
