import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/money_counter_view_model.dart';
import 'package:rive/rive.dart';

class TheButton extends StatelessWidget {
  const TheButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final cmNM = context.read<ConfirmButtonState>();
        if (cmNM.inputState == 0 || cmNM.inputState == 4) {
          cmNM.changeState(2);
        } else if (cmNM.inputState == 3) {
          

          ///触发提交
          context.read<MoneyCounterViewModel>().triggerSubmit(context);
          cmNM.changeState(4);
        }
      },
      child: _theButton(),
    );
  }

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
