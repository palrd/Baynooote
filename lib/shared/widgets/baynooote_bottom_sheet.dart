import 'package:baynooote/features/ledger/presentetion/view_models/bus/bottom_sheet_bus.dart';
import 'package:baynooote/shared/animation_set/BottomSheetJumpUpAniamtionSet.dart';
import 'package:figma_squircle/figma_squircle.dart';
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

  const BaynoooteBottomSheet(
    this.bottomSheetType, {
    this.isScrollable = false,
    this.onActive,
    this.onPackUp,
    this.child = const SizedBox(),
    this.slivers = const [],
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

    _anim = widget.isScrollable
        ? Bottomsheetjumpupaniamtionset(_controller, 85)
        : Bottomsheetjumpupaniamtionset(_controller, 35);
  }

  void _onAniamationBusChanged() {
    if (BottomSheetBus.bottomSheetNow.value == widget.bottomSheetType) {
      _activate();
    } else {
      _packUp();
    }
  }

  void _activate() {
    _controller.forward();
    widget.onActive?.call();
  }

  void _packUp() {
    widget.onPackUp?.call();

    _controller.reverse();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    BottomSheetBus.bottomSheetNow.removeListener(_onAniamationBusChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: _buildMask()),
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
        return SizedBox(
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
                  animation: _controller,
                  builder: (_, child) {
                    return Opacity(opacity: _anim.opcity.value, child: child);
                  },
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: widget.slivers,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMask() {
    return ValueListenableBuilder(
      valueListenable: BottomSheetBus.bottomSheetNow,
      builder: (_, _, child) {
        return IgnorePointer(
          //不等于none时才不允许穿透
          ignoring:
              BottomSheetBus.bottomSheetNow.value != widget.bottomSheetType,
          child: GestureDetector(
            onTap: () {
              BottomSheetBus.setSheetValue(widget.bottomSheetType);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color:
                    BottomSheetBus.bottomSheetNow.value ==
                        widget.bottomSheetType
                    ? Colors.black12
                    : Colors.transparent,
              ),
              child: Center(),
            ),
          ),
        );
      },
    );
  }
}
