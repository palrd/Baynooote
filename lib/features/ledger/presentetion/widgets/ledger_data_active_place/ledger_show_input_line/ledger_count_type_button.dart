import 'package:baynooote/features/ledger/di/ledger_module.dart';

class LedgerCountTypeButton extends StatelessWidget {
  final Widget? icon;
  final Widget? title;

  const LedgerCountTypeButton({this.icon, this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      alignment: Alignment.center,
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(margin: EdgeInsets.only(right: 5), child: icon),
          Container(child: title),
        ],
      ),
    ).addTapFeel(feelingLevel: 1);
  }
}
