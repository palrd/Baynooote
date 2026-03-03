import 'package:baynooote/features/ledger/presentetion/view_models/bus/bottom_sheet_bus.dart';
import 'package:baynooote/shared/animation_set/BottomSheetJumpUpAniamtionSet.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BaynoooteBottomSheet extends StatefulWidget {
  ///该组件是否要求可滚动
  final bool isScrollable;

  ///这个弹窗本身的名字
  final BottomSheetType bottomSheetType;

  ///弹窗起来时要做什么
  final void Function()? onActive;

  ///弹窗收起时要做什么
  final void Function()? onPackUp;

  ///列表中想放什么
  final Widget child;

  ///列表中想放什么
  final List<Widget> slivers;

  ///可以在遮罩层中放一些东西
  final Widget? maskChild;

  const BaynoooteBottomSheet(
    this.bottomSheetType, {
    this.isScrollable = false,
    this.onActive,
    this.onPackUp,
    this.child = const SizedBox(),
    this.slivers = const [],
    this.maskChild,
    super.key,
  });

  @override
  State<BaynoooteBottomSheet> createState() => _BaynoooteBottomSheetState();
}

class _BaynoooteBottomSheetState extends State<BaynoooteBottomSheet>
    with TickerProviderStateMixin {
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();
  late AnimationController _controller;
  late AnimationController _maskController;

  late Bottomsheetjumpupaniamtionset _anim;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    BottomSheetBus.bottomSheetNow.addListener(_onAniamationBusChanged);
  }

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );

    _maskController = AnimationController(
      duration: const Duration(milliseconds: 80),
      reverseDuration: Duration(milliseconds: 420),
      vsync: this,
    );

    _anim = widget.isScrollable
        ? Bottomsheetjumpupaniamtionset(_controller, _maskController, 85)
        : Bottomsheetjumpupaniamtionset(_controller, _maskController, 35);
  }

  void _onAniamationBusChanged() {
    if (BottomSheetBus.bottomSheetNow.value == widget.bottomSheetType) {
      _activate();
    }
    if (BottomSheetBus.bottomSheetNow.value != widget.bottomSheetType) {
      _packUp();
    }
  }

  void _activate() {
    _maskController.forward();
    _controller.forward();
    widget.onActive?.call();
  }

  void _packUp() {
    widget.onPackUp?.call();
    _maskController.reverse().then((_) {
      if (_scrollController.isAttached) {
        _scrollController.reset();
      }
    });
    _controller.reverse();
  }

  

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    _maskController.dispose();
    BottomSheetBus.bottomSheetNow.removeListener(_onAniamationBusChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentGeometry.bottomCenter,
          child: AnimatedBuilder(
            animation: _controller,
            child: widget.isScrollable ? _buildSheet() : widget.child,
            builder: (_, child) {
              return Transform.translate(
                offset: Offset(0.0, _anim.offsetY.value),
                child: child,
              );
            },
          ),
        ),
        Align(alignment: AlignmentGeometry.bottomCenter, child: _buildMask()),
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
                child: CustomScrollView(
                  shrinkWrap: true,
                  controller: scrollController,
                  slivers: widget.slivers,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMask() {
    return AnimatedBuilder(
      animation: _maskController,
      child: ClipSmoothRect(
        radius: SmoothBorderRadius.only(
          topLeft: SmoothRadius(cornerRadius: 20, cornerSmoothing: 1),
          topRight: SmoothRadius(cornerRadius: 20, cornerSmoothing: 1),
        ),
        child: Container(
          height: widget.isScrollable ? 85 : 35,
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
          child: widget.isScrollable ? widget.maskChild : Center(),
        ),
      ),
      builder: (_, child) {
        return Transform.translate(
          offset: Offset(0.0, _anim.maskOffsetY.value),
          child: child,
        );
      },
    );
  }
}
