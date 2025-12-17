import 'package:baynooote/features/ledger/di/ledger_module.dart';

class LedgerCallDetailSheetUp extends StatelessWidget {
  const LedgerCallDetailSheetUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 14,
            cornerSmoothing: 1,
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color.fromARGB(15, 0, 0, 0),
            offset: Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Text(
        "记账详细...",
        style: TextStyle(
          color: Color(0xFF50A7EA),
          fontWeight: FontWeight.w900,
          fontSize: 14,
        ),
      ),
    ).addTapFeel(feelingLevel: 1);
  }
}
