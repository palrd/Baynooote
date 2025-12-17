import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:rive/rive.dart';

class TheButton extends StatelessWidget {
  const TheButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _theButton().addTapFeel(
      onTap: () {
        final cmNM = context.read<ConfirmButtonState>();
        if (cmNM.inputState == 0 || cmNM.inputState == 4) {
          cmNM.changeState(2);
        } else if (cmNM.inputState == 3) {
          cmNM.changeState(4);
        }
      },
    );
  }

  ///简单的点击反馈思路
  ///检测到手势按下时，启用pressDown，然后将容器的大小缩小，并且用Curves.easeinout曲线来添加一些缓释效果
  ///检测到手势抬起时，启用pressUp，然后将容器的大小放大，并且用Curves.easeinout曲线来添加一些缓放效果
  ///最后通过一个延时将容器放回原大小即可，可以通过两个AnimatedContianer嵌套来实现
  ///第一个容器用来缩小，第二个容器用来放大，最后进行缩小
  ///但是上述这种方法不可复用，所以很麻烦
  ///我们使用一个class将初始化，和时序封装成一个个方法，
  ///然后通过手势检测将动画进行驱动，通过考虑animateValue的值来驱动不同时序位置的函数

  ///按钮本身
  Widget _theButton() {
    return Selector<QuickAnimationActiveState, int>(
      builder: (_, index, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: LedgerChoiceTypeItems.iconColorsaBegin[index],
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(15, 0, 0, 0),
                blurRadius: 15,
              ),
            ],
          ),
          child: child,
        );
      },
      child: const Center(child: RiveButton()),
      selector: (_, vm) => vm.selectedIndexActiveState,
    );
  }
}

class RiveButton extends StatefulWidget {
  const RiveButton({super.key});

  @override
  State<RiveButton> createState() => _RiveButtonState();
}

class _RiveButtonState extends State<RiveButton> {
  SMINumber? _onInput;
  @override
  Widget build(BuildContext context) {
    return Selector<ConfirmButtonState, int>(
      builder: (_, inputState, _) {
        if (inputState == 2) {
          _onInput?.value = 2;
        } else if (inputState == 3) {
          _onInput?.value = 3;
        } else if (inputState == 4) {
          _onInput?.value = 4;
        }
        return _riveAniamtion();
      },
      selector: (_, vm) => vm.inputState,
    );
  }

  ///Rive动画
  Widget _riveAniamtion() {
    return Rivewidgetbuilder(
      fileURL: 'assets/Rives/ConfirmButton.riv',
      stateMachineName: 'ConfirmButtonSM',
      onInit: (artboard, controller) {
        _onInput = controller?.findSMI('inputState');
      },
    );
  }
}
