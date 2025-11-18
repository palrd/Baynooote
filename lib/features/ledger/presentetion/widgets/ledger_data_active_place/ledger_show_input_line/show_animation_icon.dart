import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:lottie/lottie.dart';

///该组件与展示动画icon
class ShowAnimationIcon extends StatelessWidget {
  final bool isCompleted;
  final int index;
  const ShowAnimationIcon({
    this.isCompleted = false,
    this.index = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isCompleted
        ? Align(
            alignment: AlignmentGeometry.topCenter,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: LedgerChoiceTypeItems.iconColorsaBegin[index],
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    color: LedgerChoiceTypeItems.showdowColorsa[index],
                    blurStyle: BlurStyle.outer,
                  ),
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    color: const Color.fromARGB(77, 255, 255, 255),
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              duration: Duration(milliseconds: 300),
              child: Container(
                child: Lottie.asset(LedgerChoiceTypeItems.lottieJsons[index]),
              ),
            ),
          )
        : Align(
            alignment: AlignmentGeometry.topCenter,
            child: Selector<QuickAnimationActiveState, int>(
              builder: (_, index, _) {
                return AnimatedContainer(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: LedgerChoiceTypeItems.iconColorsaBegin[index],
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        color: LedgerChoiceTypeItems.showdowColorsa[index],
                        blurStyle: BlurStyle.outer,
                      ),
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        color: const Color.fromARGB(77, 255, 255, 255),
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    child: Lottie.asset(
                      LedgerChoiceTypeItems.lottieJsons[index],
                    ),
                  ),
                );
              },
              selector: (_, vm) => vm.selectedIndexActiveState,
            ),
          );
  }
}
