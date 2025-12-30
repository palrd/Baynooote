import 'dart:ui';

import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/bus/animation_bus.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/animation_set/SheetAnimationSet.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_list/list_data_time.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_list/sigal_ledger_data.dart';
import 'package:flutter/services.dart';

class LedgerDataList extends StatefulWidget {
  const LedgerDataList({super.key});

  @override
  State<LedgerDataList> createState() => _LedgerDataListState();
}

class _LedgerDataListState extends State<LedgerDataList>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Sheetanimationset anim;
  final DraggableScrollableController sheetController =
      DraggableScrollableController();
  final ValueNotifier<double> sheetNotifiler = ValueNotifier(0.0);
  double lastFrame = 0.0;
  static const double start = 0.68;
  double minSize = 0.0;
  double initSize = 0.0;

  @override
  void initState() {
    super.initState();
    initAnimation();
    AnimationBus.listAnimationBus.addListener(_onBusChnage);
  }

  @override
  void dispose() {
    AnimationBus.listAnimationBus.removeListener(_onBusChnage);
    controller.dispose();
    sheetController.dispose();
    sheetNotifiler.dispose();
    super.dispose();
  }

  void _onBusChnage() {
    if (AnimationBus.listAnimationBus.value == AnimationBusType.activate) {
      activateList();

      ///列表调起
    }
    if (AnimationBus.listAnimationBus.value == AnimationBusType.packUp) {
      packUpList();

      ///列表收起
    }
  }

  void initAnimation() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    anim = Sheetanimationset(controller);
  }

  void activateList() {
    sheetController
        .animateTo(
          0.679,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        )
        .then((_) {
          setState(() {
            minSize = 0.679;
            initSize = 0.679;
          });
        });
    controller.forward();
  }

  void packUpList() {
    sheetController
        .animateTo(
          0.0,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        )
        .then((_) {
          setState(() {
            minSize = 0.0;
            initSize = 0.0;
          });
        });
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.diagonal3Values(
            anim.scaleX.value,
            anim.scaleY.value,
            1.0,
          ),
          child: child,
        );
      },
      child: NotificationListener<DraggableScrollableNotification>(
        onNotification: (notification) {
          sheetNotifiler.value = notification.extent;

          double nowFrame = notification.extent;

          if ((lastFrame < start && nowFrame >= start) ||
              (lastFrame >= start && nowFrame < start)) {
            HapticFeedback.selectionClick();
          }
          if (nowFrame == 1.0) {
            HapticFeedback.selectionClick();
          }

          ///拿到上一帧
          lastFrame = nowFrame;
          return true;
        },
        child: DraggableScrollableSheet(
          controller: sheetController,
          initialChildSize: initSize,
          minChildSize: minSize,
          maxChildSize: 1.0,
          builder: (context, scrollController) {
            return ValueListenableBuilder(
              valueListenable: sheetNotifiler,
              child: Stack(
                children: [
                  DataListInfo(scrollController: scrollController),
                  Positioned(top: 0, left: 0, right: 0, child: ListDataTime()),
                ],
              ),
              builder: (context, value, child) {
                ///定义起点

                ///将进度做0-1映射
                double process = (value - start) / (1 - start);

                ///因为在到达起点之前是负值，所以使用clamp函数处理为0
                ///小于就是0，大于就是1
                process = process.clamp(0, 1);
                double currentPadding = 20 * (1 - process);
                double currentRadius = 30 * (1 - process);

                return Container(
                  padding: EdgeInsets.only(
                    left: currentPadding,
                    right: currentPadding,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(currentRadius),
                      topRight: Radius.circular(currentRadius),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: child,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class DataListInfo extends StatelessWidget {
  final ScrollController scrollController;
  const DataListInfo({required this.scrollController, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 50)),
            SliverFixedExtentList(
              itemExtent: 90,
              delegate: SliverChildBuilderDelegate((context, index) {
                return const RepaintBoundary(child: SigalLedgerData());
              }, childCount: 20),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
      ),
    );
  }
}
