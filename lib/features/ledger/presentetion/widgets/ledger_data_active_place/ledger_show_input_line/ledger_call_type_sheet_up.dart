import 'package:baynooote/features/ledger/di/ledger_module.dart';

class LedgerCallTypeSheetUp extends StatelessWidget {
  const LedgerCallTypeSheetUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(cornerRadius: 8, cornerSmoothing: 1),
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
        "娱乐",
        maxLines: 2,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Color(0xFF50A7EA),
          fontWeight: FontWeight.w900,
          fontSize: 14,
        ),
      ),
    ).addTapFeel(feelingLevel: 1);
  }
}
