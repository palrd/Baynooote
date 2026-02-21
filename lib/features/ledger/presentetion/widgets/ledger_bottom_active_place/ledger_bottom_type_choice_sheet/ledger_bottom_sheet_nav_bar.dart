import 'package:baynooote/features/ledger/presentetion/view_models/bus/animation_bus.dart';
import 'package:baynooote/shared/animation_set/SimpleBounceAnimationSet.dart';
import 'package:baynooote/shared/widgets/baynooote_choice_Container.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class LedgerBottomSheetNavBar extends StatefulWidget {
  const LedgerBottomSheetNavBar({super.key});

  @override
  State<LedgerBottomSheetNavBar> createState() =>
      _LedgerBottomSheetNavBarState();
}

class _LedgerBottomSheetNavBarState extends State<LedgerBottomSheetNavBar>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;
  late Animation offsetY;
  late Animation scale;

  @override
  void initState() {
    AnimationBus.typeChoiceBottomSheetAnimationBus.addListener(
      _onAnimationBusChanged,
    );
    initAnimation();
    super.initState();
  }

  void initAnimation() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 80),
      reverseDuration: Duration(milliseconds: 150),
      vsync: this,
    );
    controller2 = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    offsetY = Tween(
      begin: 85.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
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
    if (AnimationBus.typeChoiceBottomSheetAnimationBus.value ==
        AnimationBusType.activate) {
      _active();
    }
    if (AnimationBus.typeChoiceBottomSheetAnimationBus.value ==
        AnimationBusType.packUp) {
      _packUp();
    }
  }

  void _active() {
    controller.forward().then((_) {
      controller2.forward();
    });
  }

  void _packUp() {
    controller.reverse();
    controller2.reverse();
  }

  @override
  void dispose() {
    controller.dispose();
    AnimationBus.typeChoiceBottomSheetAnimationBus.removeListener(
      _onAnimationBusChanged,
    );
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: ClipSmoothRect(
        radius: SmoothBorderRadius.only(
          topLeft: SmoothRadius(cornerRadius: 20, cornerSmoothing: 1),
          topRight: SmoothRadius(cornerRadius: 20, cornerSmoothing: 1),
        ),
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),

            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(61, 0, 0, 0),
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Row(
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
          ),
        ),
      ),
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(0.0, offsetY.value),
          child: child,
        );
      },
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
