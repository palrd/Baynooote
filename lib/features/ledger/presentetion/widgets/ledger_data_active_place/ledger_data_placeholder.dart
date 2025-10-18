import 'dart:ffi';

import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_ready_inputData_placeholder.dart';

///该组件是当数据活动区无数据时展示的组件
///核心是一个容器包裹着三个内容，1.暂无记录 2.提示用户如何开始记账 3.一个用于装饰卡通动画
///动画思路
///首先内部盒子压缩关闭消失_action1
///*0.接下来根据用户选择的类型来对盒子的颜色做改变准备，同时按照类型准备好icon
///icon动画出现容器内部*1.  _action2
///在2.的同时，外部盒子开始压缩弹跳到更高的位置，
///在2.的同时，外部盒子的颜色变成0.准备好的颜色

class LedgerDataPlaceholder extends StatefulWidget {
  const LedgerDataPlaceholder({super.key});

  @override
  State<LedgerDataPlaceholder> createState() => _LedgerDataPlaceholderState();
}

class _LedgerDataPlaceholderState extends State<LedgerDataPlaceholder>
    with SingleTickerProviderStateMixin {
  ///准备动画控制器
  late AnimationController _controller;

  ///准备动画变化值
  ///外层盒子的动画S 0~0.5
  late Animation<double> _scaleAnimationXS;
  late Animation<double> _scaleAnimationYS;
  late Animation<double> _jump;
  late Animation<double> _widthStrech;
  late Animation<Color?> _bgColorAnimationTop;
  late Animation<Color?> _bgColorAnimationBottom;

  ///内部盒子动画A 0~0.5
  late Animation<double> _scaleAnimationXA;
  late Animation<double> _scaleAnimationYA;
  late Animation<double> _scaleAnimationXAT;
  late Animation<double> _scaleAnimationYAT;

  ///内部icon动画A 0.5~1.0
  late Animation<double> _scaleAnimationXB;
  late Animation<double> _scaleAnimationYB;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    ///初始化动画控制器
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _action1();
    _action2();
    _action3();
    _action4();
  }

  void _action1() {
    ///内部盒子的动画A
    //向下压缩-慢
    _scaleAnimationXA =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 1.3,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 40,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.3,
              end: 0.7,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.7,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOutCubic)),
            weight: 15,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 0,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 15,
          ),
        ]).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.3)),
        );

    _scaleAnimationYA =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 0.7,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 40,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.7,
              end: 1.3,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.3,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOutCubic)),
            weight: 15,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 0,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 15,
          ),
        ]).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.3)),
        );

    ///针对文字的动画
    _scaleAnimationXAT = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.3, curve: Curves.easeInOut),
      ),
    );
    _scaleAnimationYAT = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 0.3, curve: Curves.easeInOut),
      ),
    );
  }

  ///第二步动画开始弹跳出现
  void _action2() {
    ///形变
    _scaleAnimationXB =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.0,
              end: 1.2,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.2,
              end: 0.8,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.8,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 60,
          ),
        ]).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.3, 0.5)),
        );

    _scaleAnimationYB =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.0,
              end: 0.8,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.8,
              end: 1.2,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.2,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 60,
          ),
        ]).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.3, 0.5)),
        );
  }

  void _action3() {
    _bgColorAnimationTop =
        ColorTween(
          begin: Color.fromARGB(128, 83, 158, 249),
          end: const Color.fromARGB(200, 44, 176, 90),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.3, 0.6, curve: Curves.easeInOut),
          ),
        );
    _bgColorAnimationBottom =
        ColorTween(
          begin: Color.fromARGB(75, 97, 197, 249),
          end: const Color.fromARGB(200, 129, 201, 53),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.3, 0.6, curve: Curves.easeInOut),
          ),
        );
  }

  void _action4() {
    ///外都盒子的动画S
    _scaleAnimationXS =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 1.1,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.1,
              end: 0.9,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.9,
              end: 0.9,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 10,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.9,
              end: 1.1,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 10,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.1,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 20,
          ),
        ]).animate(
          CurvedAnimation(parent: _controller, curve: const Interval(0.5, 0.8)),
        );

    _scaleAnimationYS =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 0.9,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.9,
              end: 1.1,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight:30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.1,
              end: 1.1,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 10,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.1,
              end: 0.9,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 10,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.9,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 20,
          ),
        ]).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.5, 0.8),
          ),
        );

    _jump =
        TweenSequence([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 150,
              end: 150,
            ).chain(CurveTween(curve: Curves.linear)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 150,
              end: 30,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 30,
              end: 20,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 10,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 20,
              end: 30,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 20,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 30,
              end: 30,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 20,
          ),
        ]).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.5, 0.8),
          ),
        );

    _widthStrech = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ///外层容器
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.diagonal3Values(
            _scaleAnimationXS.value,
            _scaleAnimationYS.value,
            1.0,
          ),
          child: FractionallySizedBox(
            widthFactor: _widthStrech.value,
            child: Container(
              margin: EdgeInsets.only(top: _jump.value.sw),
              height: 200.sw,
              clipBehavior: Clip.hardEdge,
              padding: EdgeInsets.symmetric(vertical: 10.sw),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sw),
                gradient: LinearGradient(
                  ///颜色过渡
                  colors: [
                    _bgColorAnimationTop.value!,
                    _bgColorAnimationBottom.value!,
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ///默认展示提示用户对于今日记账的输入
                  LedgerReadyInputdataPlaceholder(
                    controller: _controller,
                    scaleX: _scaleAnimationXA,
                    scaleY: _scaleAnimationYA,
                    scaleXT: _scaleAnimationXAT,
                    scaleYT: _scaleAnimationYAT,
                  ),

                  ///展示icon
                  _showIcon(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _showIcon() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
            _scaleAnimationXB.value,
            _scaleAnimationYB.value,
            1.0,
          ),
          child: Container(
            padding: EdgeInsets.all(5.sw),
            child: Image.asset('assets/images/Sleeping.gif'),
          ),
        );
      },
    );
  }
}
