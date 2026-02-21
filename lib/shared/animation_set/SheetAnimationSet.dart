import 'package:flutter/material.dart';

class Sheetanimationset {
  late AnimationController controller;
  late Animation scaleX;
  late Animation scaleY;
  late Animation offsetY;

  

  Sheetanimationset(this.controller) {
    action();
  }

  void action() {
    scaleX = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    scaleY = Tween(
      begin: 2.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    
    
  }
}
