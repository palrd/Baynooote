import 'package:baynooote/app/app_router.dart';
import 'package:baynooote/app/app_theme.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/animation_active_state.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/data_active_place_view_model.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/size_get_new.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/state_card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ///在这里注册需要用到的状态模型
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => StateCardViewModel()),
        ChangeNotifierProvider(create: (ctx) => DataActivePlaceViewModel()),
        ChangeNotifierProvider(create: (ctx) => AnimationActiveState()),
        ChangeNotifierProvider(create: (ctx) => SizeGetNew()),
      ],
      child: Baynooote(),
    ),
  );
}

class Baynooote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      ///初始化路由表
      routes: AppRouter.routes,

      ///初始化页面
      initialRoute: "/ledger",

      ///初始化主题数据
      theme: AppTheme.lightTheme,
    );
  }
}
