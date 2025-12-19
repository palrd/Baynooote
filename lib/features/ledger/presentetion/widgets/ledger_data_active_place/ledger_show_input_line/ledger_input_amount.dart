import 'dart:math';
import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/bus/animation_bus.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/record_collection/record_collection_amount.dart';
import 'package:flutter/material.dart';

class LedgerInputAmount extends StatefulWidget {
  const LedgerInputAmount({super.key});

  @override
  State<LedgerInputAmount> createState() => _LedgerInputAmountState();
}

class _LedgerInputAmountState extends State<LedgerInputAmount>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;
  late Animation<double> scaleToShowAmountX;
  late Animation<double> scaleToShowAmountY;
  late Animation<double> scaleFromTipX;
  late Animation<double> scaleFromTipY;

  final List<String> _chars = ["金", "额", "输", "入", "中", ".", ".", "."];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1500), // 调整波浪速度

      vsync: this,
    );
    // 关键点：不需要 reverse，只要一直重复跑就行，形成无限循环的时间流
    controller.repeat();
    final vm = context.read<RecordCollectionAmountViewModel>();
    initAniamtion2();
    vm.addListener(() {
      ///意思是金额数据重新被从大于0的部分变回0，才执行回溯动画
      if (vm.inputBuffer == "0.00" && controller2.isCompleted) {
        controller2.reverse();
      }
      // ///意思是当金额从0变成大于0的时候才执行动画，因为后面在金额已经大于0的时候再怎么改变也不执行动画了
      else if (vm.inputBuffer != "0.00" && controller2.isDismissed) {
        controller2.forward();
      }
    });
  }

  void initAniamtion2() {
    controller2 = AnimationController(
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
      vsync: this,
    );

    /// 逻辑：先微缩蓄力 (60%) -> 瞬间反向撑大 (20%) -> 快速缩小至0 (20%)
    scaleToShowAmountX =
        TweenSequence<double>([
          // 1. 对应放大的最后一步 (0.9 -> 1.0, w60) 的逆过程
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 0.9,
            ).chain(CurveTween(curve: Curves.easeInOut)), // 慢速开始动作
            weight: 60,
          ),
          // 2. 对应放大的中间一步 (1.1 -> 0.9, w20) 的逆过程
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.9,
              end: 1.1,
            ).chain(CurveTween(curve: Curves.easeIn)), // 加速撑大
            weight: 20,
          ),
          // 3. 对应放大的第一步 (0.0 -> 1.1, w20) 的逆过程
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.1,
              end: 0.0,
            ).chain(CurveTween(curve: Curves.easeOut)), // 快速收缩消失
            weight: 20,
          ),
        ]).animate(
          CurvedAnimation(parent: controller2, curve: const Interval(0.0, 0.5)),
        );

    scaleToShowAmountY =
        TweenSequence<double>([
          // 1. 对应放大的最后一步 (1.1 -> 1.0, w60) 的逆过程
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 1.1,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 60,
          ),
          // 2. 对应放大的中间一步 (0.9 -> 1.1, w20) 的逆过程
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.1,
              end: 0.9,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 20,
          ),
          // 3. 对应放大的第一步 (0.0 -> 0.9, w20) 的逆过程
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.9,
              end: 0.0,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 20,
          ),
        ]).animate(
          CurvedAnimation(parent: controller2, curve: const Interval(0.0, 0.5)),
        );

    /// 放大 (ScaleFromExpense) - 保持不变，这是基准
    scaleFromTipX =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.0,
              end: 1.1,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.1,
              end: 0.9,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.9,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 60,
          ),
        ]).animate(
          CurvedAnimation(parent: controller2, curve: const Interval(0.5, 1.0)),
        );

    scaleFromTipY =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.0,
              end: 0.9,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.9,
              end: 1.1,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.1,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 60,
          ),
        ]).animate(
          CurvedAnimation(parent: controller2, curve: const Interval(0.5, 1.0)),
        );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.centerLeft,
      children: [
        AnimatedBuilder(
          animation: controller2,
          child: _buildInputTip(),
          builder: (_, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.diagonal3Values(
                scaleToShowAmountX.value,
                scaleToShowAmountY.value,
                1.0,
              ),
              child: child,
            );
          },
        ),
        AnimatedBuilder(
          animation: controller2,
          child: _buildShowAmount(),
          builder: (_, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.diagonal3Values(
                scaleFromTipX.value,
                scaleFromTipY.value,
                1.0,
              ),
              child: child,
            );
          },
        ),
      ],
    ).addTapFeel(
      feelingLevel: 1,
      onTap: () {
        AnimationBus.numberKeyBoardAnimationBus.value =
            AnimationBus.numberKeyBoardAnimationBus.value ==
                AnimationBusType.activate
            ? AnimationBusType.packUp
            : AnimationBusType.activate;
      },
    );
  }

  Widget _buildInputTip() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // 遍历字符列表，传入索引 index
      children: List.generate(_chars.length, (index) {
        return _buildWaveChar(index, _chars[index]);
      }),
    );
  }

  Widget _buildWaveChar(int index, String char) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        ///计算时间
        double t = controller.value * 2 * pi;

        ///计算延迟
        double phase = index * 0.5;

        ///计算偏移量
        double offsetY = sin(t - phase) * 2;

        return Transform.translate(
          filterQuality: FilterQuality.high,
          offset: Offset(0, offsetY),
          child: child,
        );
      },
      child: Container(
        child: Text(
          char,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white, // 注意背景如果是白的要改颜色
            fontWeight: FontWeight.bold,
            fontFamily: 'Qinfen',
            height: 1.0,
          ),
        ),
      ),
    );
  }

  Widget _buildShowAmount() {
    return Selector<RecordCollectionAmountViewModel, String>(
      builder: (_, inputBuffer, _) {
        return Text(
          inputBuffer,
          maxLines: 1,
          style: TextStyle(
            overflow: TextOverflow.clip,
            height: 1.0,
            fontFamily: 'Qinfen',
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      },
      shouldRebuild: (previous, next) {
        if (next == "0.00") {
          return false;
        } else {
          return true;
        }
      },
      selector: (_, vm) => vm.inputBuffer,
    );
  }
}
