import 'package:baynooote/features/ledger/di/ledger_module.dart';

class Bottomsheetjumpupaniamtionset {
  late AnimationController controller;
  late Animation offsetY;
  late Animation opcity;

  Bottomsheetjumpupaniamtionset(this.controller) {
    initAnimation();
  }

  void initAnimation() {
    offsetY = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 1200.0,
          end: 30.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 65,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 30.0,
          end: 60.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 35,
      ),
    ]).animate(controller);

    opcity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }
}
