import 'dart:math';

import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/record_collection/record_collection_record_type.dart';

class LedgerShowCountType extends StatefulWidget {
  final double width;
  final double height;
  const LedgerShowCountType({this.width = 23, this.height = 8, super.key});

  @override
  State<LedgerShowCountType> createState() => _LedgerShowCountTypeState();
}

class _LedgerShowCountTypeState extends State<LedgerShowCountType>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleToIncomeX;
  late Animation<double> scaleToIncomeY;
  late Animation<double> scaleFromExpenseX;
  late Animation<double> scaleFromExpenseY;

  @override
  void initState() {
    super.initState();
    initAnimation();
    final vm = context.read<RecordCollectionViewModel>();
    vm.addListener(() {

      ///1向前
      if (vm.recordType == RecordType.income) {
        controller.forward();
      }
      ///0向后
      else if (vm.recordType == RecordType.expend) {
        controller.reverse();
      }
    });
  }

  void initAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    /// 缩小 (ScaleToIncome) - 调整为与放大完全对称
    /// 逻辑：先微缩蓄力 (60%) -> 瞬间反向撑大 (20%) -> 快速缩小至0 (20%)
    scaleToIncomeX =
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
          CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.5)),
        );

    scaleToIncomeY =
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
          CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.5)),
        );

    /// 放大 (ScaleFromExpense) - 保持不变，这是基准
    scaleFromExpenseX =
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
          CurvedAnimation(parent: controller, curve: const Interval(0.5, 1.0)),
        );

    scaleFromExpenseY =
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
          CurvedAnimation(parent: controller, curve: const Interval(0.5, 1.0)),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [_buildIncome(), _buildExpense()],
      ),
    ).addTapFeel(
      onTap: () {
        final vm = context.read<RecordCollectionViewModel>();

        vm.changeRecordType();
      },
    );
  }

  Widget _buildExpense() {
    return AnimatedBuilder(
      animation: controller,
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 234, 80, 80),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(),
      ),
      builder: (_, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            scaleToIncomeX.value,
            scaleToIncomeY.value,
            1.0,
          ),
          child: child,
        );
      },
    );
  }

  Widget _buildIncome() {
    return AnimatedBuilder(
      animation: controller,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            transformAlignment: Alignment.center,
            transform: Matrix4.diagonal3Values(1.0, 1.0, 1.0),
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 106, 234, 80),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(),
          ),
          Container(
            height: widget.width,
            width: widget.height,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 106, 234, 80),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(),
          ),
        ],
      ),
      builder: (_, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            scaleFromExpenseX.value,
            scaleFromExpenseY.value,
            1.0,
          ),
          child: child,
        );
      },
    );
  }
}
