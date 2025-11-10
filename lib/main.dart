import 'package:baynooote/app/app_router.dart';
import 'package:baynooote/app/app_theme.dart';
import 'package:baynooote/core/util/size_fit_util.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/detail_record_view_model.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/money_counter_view_model.dart';
import 'package:baynooote/shared/widgets/app_starter.dart';
import 'package:baynooote/shared/widgets/baynooote.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/quick_input_animation_active_state.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/data_active_place_view_model.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/size_get_new.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/state_card_view_model.dart';
import 'package:rive/rive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RiveFile.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => StateCardViewModel()),
        ChangeNotifierProvider(create: (ctx) => DataActivePlaceViewModel()),
        ChangeNotifierProvider(create: (ctx) => QuickAnimationActiveState()),
        ChangeNotifierProvider(create: (ctx) => SizeGetNew()),
        ChangeNotifierProvider(create: (ctx) => ConfirmButtonState()),
        ChangeNotifierProvider(create: (ctx) => MoneyCounterViewModel()),
        ChangeNotifierProvider(create: (ctx) => DetailRecordViewModel()),
      ],
      child: Baynooote(),
    ),

    ///在这里注册需要用到的状态模型
  );
}

