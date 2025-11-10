//全局的页面路由注册处

//SDK导入
import 'package:baynooote/shared/widgets/app_starter.dart';
import 'package:flutter/material.dart';

//私有文件导入
import 'package:baynooote/features/ledger/presentetion/ledger_page.dart';

class AppRouter {
  //初始化屏幕为记账页面
  static final String initRoute = LedgerPage.routeName;

  //路由表
  static final Map<String, WidgetBuilder> routes = {
    LedgerPage.routeName: (ctx) => LedgerPage(),
    AppStarter.routeName: (ctx) => AppStarter(),
  };
}
