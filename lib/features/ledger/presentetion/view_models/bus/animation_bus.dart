import 'package:flutter/material.dart';

///packUp: 收起, activate: 调起
enum AnimationBusType { packUp, activate }

class AnimationBus {
  static final ValueNotifier<AnimationBusType> listAnimationBus = ValueNotifier(
    AnimationBusType.packUp,
  );
  static final ValueNotifier<AnimationBusType> numberKeyBoardAnimationBus =
      ValueNotifier(AnimationBusType.packUp);

  static final ValueNotifier<AnimationBusType>
  typeChoiceBottomSheetAnimationBus = ValueNotifier(AnimationBusType.packUp);
}
