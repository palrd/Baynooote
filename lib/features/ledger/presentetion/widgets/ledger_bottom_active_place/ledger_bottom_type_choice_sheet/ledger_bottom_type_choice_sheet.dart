import 'dart:ui';

import 'package:baynooote/features/ledger/presentetion/view_models/bus/animation_bus.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_bottom_active_place/ledger_bottom_type_choice_sheet/ledger_search.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_bottom_active_place/ledger_bottom_type_choice_sheet/ledger_sigal_type_choice.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/animation_set/SheetAnimationSet.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LedgerBottomTypeChoiceSheet extends StatefulWidget {
  const LedgerBottomTypeChoiceSheet({super.key});

  @override
  State<LedgerBottomTypeChoiceSheet> createState() =>
      _LedgerBottomTypeChoiceSheetState();
}

class _LedgerBottomTypeChoiceSheetState
    extends State<LedgerBottomTypeChoiceSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Sheetanimationset _anim;
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();
  double _initSize = 0.0;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    AnimationBus.typeChoiceBottomSheetAnimationBus.addListener(
      _onAniamationBusChanged,
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
    _scrollController
        .animateTo(
          0.35,
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        )
        .then((_) {
          setState(() {
            _initSize = 0.5;
          });
        });
    _controller.forward();
  }

  void _packUp() {
    _scrollController
        .animateTo(
          0.0,
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        )
        .then((_) {
          setState(() {
            _initSize = 0.0;
          });
        });
    _controller.reverse();
  }

  void _initAnimation() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );
    _anim = Sheetanimationset(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    AnimationBus.typeChoiceBottomSheetAnimationBus.removeListener(
      _onAniamationBusChanged,
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: DraggableScrollableSheet(
        initialChildSize: _initSize,
        minChildSize: 0.0,
        maxChildSize: 1.0,
        controller: _scrollController,
        builder: (context, scrollController) {
          return Container(
            // padding: EdgeInsets.symmetric(horizontal: 20),
            child: ClipSmoothRect(
              radius: SmoothBorderRadius.only(
                topLeft: SmoothRadius(cornerRadius: 25, cornerSmoothing: 1.0),
                topRight: SmoothRadius(cornerRadius: 25, cornerSmoothing: 1.0),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  color: const Color.fromARGB(17, 255, 255, 255),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(
                      context,
                    ).copyWith(scrollbars: false),
                    child: CustomScrollView(
                      shrinkWrap: true,
                      controller: scrollController,
                      slivers: [
                        SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          sliver: SliverToBoxAdapter(child: LedgerSearch()),
                        ),

                        SliverToBoxAdapter(child: SizedBox(height: 20)),

                        SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              childCount: 30,
                              (_, index) {
                                return LedgerSigalTypeChoice();
                              },
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 100,
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
      ),
      builder: (_, child) {
        return Transform.scale(
          scaleX: _anim.scaleX.value,
          scaleY: _anim.scaleY.value,
          alignment: Alignment.bottomCenter,
          child: child,
        );
      },
    );
  }
}
