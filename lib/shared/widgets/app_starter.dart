import 'package:baynooote/core/util/size_fit_util.dart';
import 'package:baynooote/features/ledger/di/ledger_module.dart';

class AppStarter extends StatefulWidget {
  static const String routeName = "/app_starter";
  const AppStarter({super.key});

  @override
  State<AppStarter> createState() => _AppStarterState();
}

class _AppStarterState extends State<AppStarter> {
  @override
  void initState() {
    super.initState();
    _initScreenAndNavigator();
  }

  Future<void> _initScreenAndNavigator() async {
    final vm = context.read<SizeGetNew>();

    ///如果已经完成了初始化就不再进行初始化了
    if (vm.isNewSize) {
      return _navigatorToLedgerPage();
    }

    await WidgetsBinding.instance.endOfFrame;

    Size? size;
    const maxTry = 10;
    const delay = Duration(milliseconds: 80);

    ///轮询获取屏幕尺寸
    for (int i = 0; i < maxTry; i++) {
      size = _safeSize();

      ///获取到了就跳出循环
      if (size?.width != 0 && size?.height != 0) {
        debugPrint("在第$i 次尝试中获取到了屏幕尺寸");
        break;
      }

      ///否则等待一会儿再试
      await Future.delayed(delay);
    }

    ///还是空，那就再尝试一次
    if (size == null) {
      await Future.delayed(Duration(milliseconds: 200));
      size = _safeSize();
    }

    // 如果还是拿不到，就放弃并打印警告
    if (size == null) {
      debugPrint("⚠️ 屏幕尺寸仍未获取到，初始化中断");
      return;
    }

    ///不为空了，初始化UI尺寸工具
    debugPrint("✅ 屏幕尺寸初始化成功：$size");
    SizeFitUtil.init(size);
    vm.setSize(size);

    ///延迟一会儿再跳转
    await Future.delayed(const Duration(milliseconds: 300));
    _navigatorToLedgerPage();
  }

  ///初始化函数
  Size? _safeSize() {
    final mq = MediaQuery.maybeOf(context);
    if (mq == null) return null;
    Size size = mq.size;
    if (size.width == 0 || size.height == 0) return null;
    return size;
  }

  _navigatorToLedgerPage() {
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed("/ledger");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
