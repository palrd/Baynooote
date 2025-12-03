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
    _navigatorToLedgerPage();
  }

  _navigatorToLedgerPage() {
    if (!mounted) return;
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed("/ledger");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
