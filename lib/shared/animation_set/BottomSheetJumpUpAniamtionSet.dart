import 'package:baynooote/features/ledger/di/ledger_module.dart';

class Bottomsheetjumpupaniamtionset {
  late AnimationController controller;
  late AnimationController maskController;
  late Animation offsetY;
  late Animation maskOffsetY;
  late Animation reverseOffsetY;
  late double height;

  Bottomsheetjumpupaniamtionset(
    this.controller,
    this.maskController,
    this.height,
  ) {
    initAnimation();
  }

  void initAnimation() {
    offsetY = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 1200.0,
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

    maskOffsetY = Tween(
      begin: height,
      end: 0.0,
    ).animate(CurvedAnimation(parent: maskController, curve: Curves.easeOut));
  }
}
