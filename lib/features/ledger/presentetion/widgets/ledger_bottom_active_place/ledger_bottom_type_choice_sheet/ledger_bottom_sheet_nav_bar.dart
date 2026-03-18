import 'package:baynooote/features/ledger/presentetion/view_models/bus/bottom_sheet_bus.dart';
import 'package:baynooote/shared/widgets/baynooote_choice_Container.dart';
import 'package:flutter/material.dart';

class LedgerBottomSheetNavBar extends StatefulWidget {
  const LedgerBottomSheetNavBar({super.key});

  @override
  State<LedgerBottomSheetNavBar> createState() =>
      _LedgerBottomSheetNavBarState();
}

class _LedgerBottomSheetNavBarState extends State<LedgerBottomSheetNavBar>
    with TickerProviderStateMixin {
  late AnimationController controller2;
  late Animation scale;

  @override
  void initState() {
    initAnimation();
    BottomSheetBus.bottomSheetNow.addListener(_onAnimationBusChanged);
    super.initState();
  }

  void initAnimation() {
    controller2 = AnimationController(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 420),
      vsync: this,
    );

    scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 1.1,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.1,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 50,
      ),
    ]).animate(controller2);
  }

  void _onAnimationBusChanged() {
    if (BottomSheetBus.bottomSheetNow.value == BottomSheetType.typeChoice) {
      _active();
    } else {
      _packUp();
    }
  }

  void _active() {
    controller2.forward();
  }

  void _packUp() {
    controller2.reverse();
  }

  @override
  void dispose() {
    controller2.dispose();
    BottomSheetBus.bottomSheetNow.removeListener(_onAnimationBusChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildButton(
          Icon(Icons.star, size: 30, color: Colors.white),
          "收藏",
          Color(0xFF50A7EA),
        ),
        _buildButton(
          Icon(Icons.add_rounded, size: 30, color: Colors.white),
          "新建",
          Color.fromARGB(255, 234, 80, 80),
        ),
        _buildButton(
          Icon(Icons.search, size: 30, color: Colors.white),
          "搜索",
          Color.fromARGB(255, 234, 80, 180),
        ),
        _buildButton(
          Icon(Icons.all_inbox_sharp, size: 30, color: Colors.white),
          "全部",
          Color.fromARGB(255, 234, 119, 80),
        ),
      ],
    );
  }

  Widget _buildButton(Widget icon, String title, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: controller2,
          child: BaynoooteChoiceContainer(
            containerHeight: 50,
            containerWidth: 50,
            borderWidth: 3.5,
            backgroundColor: color,
            icon: icon,
          ),
          builder: (_, child) {
            return Transform.scale(scale: scale.value, child: child);
          },
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
