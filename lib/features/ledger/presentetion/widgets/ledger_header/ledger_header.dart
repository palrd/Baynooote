import 'dart:ui';
import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/bus/bottom_sheet_bus.dart';

class LedgerHeader extends StatefulWidget {
  const LedgerHeader({super.key});

  @override
  State<LedgerHeader> createState() => _LedgerHeaderState();
}

class _LedgerHeaderState extends State<LedgerHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> translateY;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    BottomSheetBus.isSheetMax.addListener(_onBusChanged);
  }

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      reverseDuration: Duration(milliseconds: 80),
    );
    translateY = Tween(
      begin: -100.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _onBusChanged() {
    if (BottomSheetBus.isSheetMax.value) {
      active();
    } else {
      packUp();
    }
  }

  void active() {
    _controller.forward();
  }

  void packUp() {
    _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    BottomSheetBus.isSheetMax.removeListener(_onBusChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [buildBackground(), buildHeader()]);
  }

  Widget buildHeader() {
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

  Widget buildBackground() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(0, translateY.value),
          child: child,
        );
      },
      child: Container(
        height: 100,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
