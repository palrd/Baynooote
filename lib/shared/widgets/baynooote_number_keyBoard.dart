import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/bus/animation_bus.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/record_collection/record_collection_amount.dart';
import 'dart:ui';

class BaynoooteNumberKeyboard extends StatefulWidget {
  const BaynoooteNumberKeyboard({super.key});

  @override
  State<BaynoooteNumberKeyboard> createState() =>
      _BaynoooteNumberKeyboardState();
}

class _BaynoooteNumberKeyboardState extends State<BaynoooteNumberKeyboard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation scaleX;
  late Animation scaleY;
  late Animation translateY;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    action();
    AnimationBus.numberKeyBoardAnimationBus.addListener(() {
      if (AnimationBus.numberKeyBoardAnimationBus.value ==
          AnimationBusType.activate) {
        activateKeyBoard();
      }
      if (AnimationBus.numberKeyBoardAnimationBus.value ==
          AnimationBusType.packUp) {
        packUpKeyBoard();
      }
    });
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
    translateY = Tween(
      begin: 460.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  void activateKeyBoard() {
    controller.forward();
  }

  void packUpKeyBoard() {
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: _buildKeyboard(),
      builder: (_, child) {
        return Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()
            ..translateByDouble(0.0, translateY.value, 0.0, 1.0)
            ..scaleByDouble(scaleX.value, scaleY.value, 1.0, 1.0),
          child: child,
        );
      },
    );
  }

  Widget _buildKeyboard() {
    return ClipSmoothRect(
      radius: SmoothBorderRadius.only(
        topLeft: SmoothRadius(cornerRadius: 20, cornerSmoothing: 1),
        topRight: SmoothRadius(cornerRadius: 20, cornerSmoothing: 1),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Container(
          height: 230,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(childCount: 12, (
                  _,
                  index,
                ) {
                  final vm = context.read<RecordCollectionAmountViewModel>();

                  if (index < 9) {
                    return SigalNumberKey(
                      number: (index + 1).toString(),
                    ).addTapFeel(
                      feelingLevel: 1,
                      onTap: () => vm.handleNumber((index + 1).toString()),
                    );
                  }
                  if (index == 9) {
                    return Container(
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 10,
                            cornerSmoothing: 1,
                          ),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          ".",
                          style: TextStyle(
                            overflow: TextOverflow.clip,
                            height: 1.0,
                            fontFamily: 'Qinfen',
                            fontSize: 26,
                            color: Color(0xFF50A7EA),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ).addTapFeel(
                      feelingLevel: 1,
                      onTap: () => vm.handleNumber("."),
                    );
                  }
                  if (index == 10) {
                    return SigalNumberKey(number: "0").addTapFeel(
                      feelingLevel: 1,
                      onTap: () => vm.handleNumber("0"),
                    );
                  }
                  return Container(
                    decoration: ShapeDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: 10,
                          cornerSmoothing: 1,
                        ),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.backspace_outlined,
                        color: Color(0xFF50A7EA),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ).addTapFeel(
                    feelingLevel: 1,
                    isUseLongPress: true,
                    triggerTimer: 80,
                    onTap: () => vm.delete(),
                  );
                }),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 46.5,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SigalNumberKey extends StatelessWidget {
  final String number;
  const SigalNumberKey({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(cornerRadius: 8, cornerSmoothing: 1),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        number,
        style: TextStyle(
          overflow: TextOverflow.clip,
          height: 1.0,
          fontFamily: 'Qinfen',
          fontSize: 26,
          color: Color(0xFF50A7EA),
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
