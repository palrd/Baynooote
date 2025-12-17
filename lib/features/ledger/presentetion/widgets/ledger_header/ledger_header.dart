import 'dart:ui';
import 'package:baynooote/features/ledger/di/ledger_module.dart';

class LedgerHeader extends StatelessWidget {
  const LedgerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipSmoothRect(
      radius: SmoothBorderRadius.only(
        bottomLeft: SmoothRadius(cornerRadius: 20, cornerSmoothing: 1),
        bottomRight: SmoothRadius(cornerRadius: 20, cornerSmoothing: 1),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: 90,
          color: Colors.transparent,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Text(
            "Baynooote",
            style: TextStyle(
              fontSize: AppTheme.biggestTitle,
              color: const Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontFamily: "Qinfen",
              shadows: [
                BoxShadow(
                  color: Colors.black.withAlpha(0x4C),
                  offset: Offset(5, 0),
                  blurRadius: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
