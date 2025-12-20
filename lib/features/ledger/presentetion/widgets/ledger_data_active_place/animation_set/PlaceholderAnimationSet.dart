import 'package:baynooote/features/ledger/di/ledger_module.dart';

class Placeholderanimationset {
  late AnimationController controller;

  ///准备动画变化值
  ///外层盒子的动画S 0~0.5
  late Animation<double> scaleAnimationXS;
  late Animation<double> scaleAnimationYS;
  late Animation<double> jumpMargin;
  late Animation<Alignment> jumpAlign;
  late Animation<double> widthStrech;
  late Animation<Color?> bgColorAnimationTop;
  late Animation<Color?> bgColorAnimationBottom;

  ///内部盒子动画A 0~0.5
  late Animation<double> scaleAnimationXA;
  late Animation<double> scaleAnimationYA;
  late Animation<double> scaleAnimationXAT;
  late Animation<double> scaleAnimationYAT;

  ///内部icon动画A 0.5~1.0
  late Animation<double> scaleAnimationXB;
  late Animation<double> scaleAnimationYB;

  late Animation<double> radiusChange;

  Placeholderanimationset(this.controller) {
    action1();
    action2();
    action3();
    action4();
  }

  void action1() {
    ///内部盒子的动画A
    //向下压缩-慢
    scaleAnimationXA =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 1.1,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 40,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.1,
              end: 0.8,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.8,
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
          CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.2)),
        );

    scaleAnimationYA =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 0.8,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 40,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.8,
              end: 1.1,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.1,
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
          CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.2)),
        );

    ///针对文字的动画
    scaleAnimationXAT = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.16, 0.2, curve: Curves.easeInOut),
      ),
    );
    scaleAnimationYAT = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.16, 0.2, curve: Curves.easeInOut),
      ),
    );
  }

  ///第二步动画开始弹跳出现
  void action2() {
    ///形变
    scaleAnimationXB =
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
          CurvedAnimation(parent: controller, curve: const Interval(0.2, 0.5)),
        );

    scaleAnimationYB =
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
          CurvedAnimation(parent: controller, curve: const Interval(0.2, 0.5)),
        );
  }

  void action3() {
    radiusChange = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.9, curve: Curves.easeInOut),
      ),
    );
  }

  void action4() {
    ///外都盒子的动画S
    scaleAnimationXS =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.0,
              end: 1.05,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.05,
              end: 0.95,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.95,
              end: 0.95,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 10,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.95,
              end: 1.03,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 10,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.03,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 20,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0.4, 0.8)),
        );

    scaleAnimationYS =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.05,
              end: 0.95,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.95,
              end: 1.05,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 30,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.05,
              end: 1.05,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 10,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 1.05,
              end: 0.97,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 10,
          ),
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 0.97,
              end: 1.0,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 20,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0.4, 0.8)),
        );

    jumpMargin =
        TweenSequence([
          ///保持
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 30,
              end: 30,
            ).chain(CurveTween(curve: Curves.linear)),
            weight: 30,
          ),

          ///起跳
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 30,
              end: 20,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 20,
          ),

          ///跳到更高
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 20,
              end: 10,
            ).chain(CurveTween(curve: Curves.easeIn)),
            weight: 10,
          ),

          ///下落
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 10,
              end: 30,
            ).chain(CurveTween(curve: Curves.easeOut)),
            weight: 20,
          ),

          ///落地保持
          TweenSequenceItem(
            tween: Tween<double>(
              begin: 30,
              end: 30,
            ).chain(CurveTween(curve: Curves.linear)),
            weight: 20,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0.4, 0.7)),
        );

    jumpAlign =
        TweenSequence<Alignment>([
          ///保持
          TweenSequenceItem(
            tween: Tween<Alignment>(
              begin: Alignment.center,
              end: Alignment.center,
            ).chain(CurveTween(curve: Curves.linear)),
            weight: 30,
          ),

          ///起跳
          TweenSequenceItem(
            tween: Tween<Alignment>(
              begin: Alignment.center,
              end: Alignment.topCenter,
            ).chain(CurveTween(curve: Curves.easeInOut)),
            weight: 30,
          ),

          ///保持
          TweenSequenceItem(
            tween: Tween<Alignment>(
              begin: Alignment.topCenter,
              end: Alignment.topCenter,
            ).chain(CurveTween(curve: Curves.linear)),
            weight: 40,
          ),
        ]).animate(
          CurvedAnimation(parent: controller, curve: const Interval(0.4, 0.7)),
        );

    widthStrech = Tween<double>(begin: 0.65, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.65, 0.75, curve: Curves.easeInOut),
      ),
    );
  }
}
