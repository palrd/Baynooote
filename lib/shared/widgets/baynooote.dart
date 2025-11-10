import 'package:baynooote/app/app_router.dart';
import 'package:baynooote/features/ledger/di/ledger_module.dart';



class Baynooote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      ///初始化路由表
      routes: AppRouter.routes,
      ///初始化页面
      initialRoute: "/app_starter",
      ///初始化主题数据
      theme: AppTheme.lightTheme,
    );
  }
}
