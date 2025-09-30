import 'package:baynooote/app/app_router.dart';
import 'package:baynooote/app/app_theme.dart';
import 'package:baynooote/core/util/size_fit_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Baynooote());
}

class Baynooote extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      SizeFitUtil.init(size);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //初始化路由表
      routes: AppRouter.routes,
      //初始化页面
      initialRoute: "/ledger",
      //初始化主题数据
      theme: AppTheme.lightTheme,
    );
  }
}
