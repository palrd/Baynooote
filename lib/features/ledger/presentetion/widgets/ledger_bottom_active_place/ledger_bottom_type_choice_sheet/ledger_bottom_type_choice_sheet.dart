import 'dart:ui';

import 'package:baynooote/features/ledger/presentetion/view_models/bus/animation_bus.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_bottom_active_place/ledger_bottom_type_choice_sheet/ledger_bottom_sheet_nav_bar.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_bottom_active_place/ledger_bottom_type_choice_sheet/ledger_sigal_type_choice.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class LedgerBottomTypeChoiceSheet extends StatefulWidget {
  const LedgerBottomTypeChoiceSheet({super.key});

  @override
  State<LedgerBottomTypeChoiceSheet> createState() =>
      _LedgerBottomTypeChoiceSheetState();
}

class _LedgerBottomTypeChoiceSheetState
    extends State<LedgerBottomTypeChoiceSheet>
    with SingleTickerProviderStateMixin {
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();
  late AnimationController controller;
  late Animation offsetY;
  late Animation opacity;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    AnimationBus.typeChoiceBottomSheetAnimationBus.addListener(
      _onAniamationBusChanged,
    );
  }

  void _initAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
      reverseDuration: const Duration(milliseconds: 300),
    );

    offsetY = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 1000.0,
          end: -30.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 65,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: -30.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 35,
      ),
    ]).animate(controller);

    opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.ease),
      ),
    );
  }

  void _onAniamationBusChanged() {
    if (AnimationBus.typeChoiceBottomSheetAnimationBus.value ==
        AnimationBusType.activate) {
      _activate();
    }
    if (AnimationBus.typeChoiceBottomSheetAnimationBus.value ==
        AnimationBusType.packUp) {
      _packUp();
    }
  }

  void _activate() {
    controller.forward();
  }

  void _packUp() {
    controller.reverse().then((_) {
      setState(() {
        _scrollController.reset();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    AnimationBus.typeChoiceBottomSheetAnimationBus.removeListener(
      _onAniamationBusChanged,
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: controller,
          child: _buildSheet(),
          builder: (_, child) {
            return Transform.translate(
              offset: Offset(0.0, offsetY.value),
              child: child,
            );
          },
        ),
        Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: SizedBox(
            height: 85,
            child: Center(child: LedgerBottomSheetNavBar()),
          ),
        ),
      ],
    );
  }

  Widget _buildSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      minChildSize: 0.0,
      maxChildSize: 1.0,
      controller: _scrollController,
      builder: (context, scrollController) {
        return Container(
          child: ClipSmoothRect(
            radius: SmoothBorderRadius.only(
              topLeft: SmoothRadius(cornerRadius: 30, cornerSmoothing: 1.0),
              topRight: SmoothRadius(cornerRadius: 30, cornerSmoothing: 1.0),
            ),
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(
                  context,
                ).copyWith(scrollbars: false),
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (_, child) {
                    return Opacity(opacity: 1.0, child: child);
                  },
                  child: CustomScrollView(
                    shrinkWrap: true,
                    controller: scrollController,
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(childCount: 30, (
                            _,
                            index,
                          ) {
                            return SizedBox(
                              height: 100,
                              child: LedgerSigalTypeChoice(),
                            );
                          }),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 100,
                                crossAxisSpacing: 10,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
