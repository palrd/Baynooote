import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:baynooote/shared/animation_set/PlaceholderAnimationSet.dart';
import 'package:lottie/lottie.dart';

///该组件中，展示的内容是，提示用户当前没有数据，可以输入数据
///关于该组件的动画：
///状态1：默认准备为提示状态
///状态2：进入就绪状态
class LedgerReadyInputdataPlaceholder extends StatelessWidget {
  final Placeholderanimationset anim;
  const LedgerReadyInputdataPlaceholder({required this.anim, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///默认为就绪
        _containerAnimationBuilder(context),
      ],
    );
  }

  ///动画组件
  Widget _containerAnimationBuilder(BuildContext context) {
    return Column(children: [_texyContainer(), _animationIcon(context)]);
  }

  ///文字动画
  Widget _texyContainer() {
    return AnimatedBuilder(
      animation: anim.controller,
      child: Column(children: [noDataText(), tipStartLedgerText()]),
      builder: (context, child) {
        return Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.diagonal3Values(
            ///这个值控制X
            anim.scaleAnimationXAT.value,

            ///这个值控制Y
            anim.scaleAnimationYAT.value,
            1.0,
          ),
          child: child,
        );
      },
    );
  }

  ///1.暂无记录
  Widget noDataText() {
    return Text(
      "暂无记录...",
      style: TextStyle(
        fontSize: AppTextTheme.bodyMedium.fontSize,
        fontWeight: FontWeight.w800,
        color: AppTheme.iconColor,
        letterSpacing: -0.6,
      ),
    );
  }

  ///提示记录方式,以及开始记录
  Widget tipStartLedgerText() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Text(
        "点击铅笔或点击下方快速记账。",
        style: TextStyle(
          fontSize: AppTextTheme.bodyMedium.fontSize,
          fontWeight: FontWeight.w800,
          color: AppTheme.iconColor,
          letterSpacing: -0.6,
        ),
      ),
    );
  }

  ///一个快速记录的动画ICon
  Widget _animationIcon(BuildContext context) {
    return Expanded(
      child: AnimatedBuilder(
        animation: anim.controller,
        builder: (_, child) {
          return Transform(
            alignment: Alignment.bottomCenter,
            transform: Matrix4.diagonal3Values(
              ///这个值控制X
              anim.scaleAnimationXA.value,

              ///这个值控制Y
              anim.scaleAnimationYA.value,
              1.0,
            ),
            child: child,
          );
        },
        child:
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Lottie.asset(LedgerChoiceTypeItems.lottieJsons[2]),
            ).addTapFeel(
              onTap: () {
                anim.controller.forward();

                final btVM = context.read<ConfirmButtonState>();
                if (btVM.inputState == 0 || btVM.inputState == 4) {
                  btVM.changeState(2);
                }
              },
              isSelfAnimationWillHappen: true,
            ),
      ),
    );
  }
}
