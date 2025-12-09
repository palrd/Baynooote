import 'package:baynooote/features/ledger/di/ledger_module.dart';

///该组件用于生成一个自动延展到父容器比例宽度的线
class ClipLine extends StatelessWidget {
  final double width;
  final Color lineColor;
  final double lineHeight;
  const ClipLine({
    this.width = 1.0,
    this.lineColor = Colors.white,
    this.lineHeight = 4,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerLeft,
      child: FractionallySizedBox(
        widthFactor: width,
        child: Container(
          decoration: BoxDecoration(
            color: lineColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(height: lineHeight),
        ),
      ),
    );
  }
}
