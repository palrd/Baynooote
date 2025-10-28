import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:lottie/lottie.dart';

///该组件中，展示的内容是，提示用户当前没有数据，可以输入数据
///关于该组件的动画：
///状态1：默认准备为提示状态
///状态2：进入就绪状态
class LedgerReadyInputdataPlaceholder extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scaleX;
  final Animation<double> scaleY;
  final Animation<double> scaleXT;
  final Animation<double> scaleYT;
  const LedgerReadyInputdataPlaceholder({
    required this.controller,
    required this.scaleX,
    required this.scaleY,
    required this.scaleXT,
    required this.scaleYT,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///默认为就绪
        TipInputMode(
          controller: controller,
          scaleAnimationX: scaleX,
          scaleAnimationY: scaleY,
          scaleAnimationXT: scaleXT,
          scaleAnimationYT: scaleYT,
        ),
      ],
    );
  }
}

///提示状态1
///描述一下这个组件的动画
///使用一个状态来进行管理
///当值改变时
///首先：进行scale变换，横向拉伸，向下压缩
///到一定时间纵向拉伸然后迅速收回，知道缩小为0，也就是不展示状态
///时间节奏是慢快，曲线选择ease in out
class TipInputMode extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scaleAnimationX;
  final Animation<double> scaleAnimationY;
  final Animation<double> scaleAnimationXT;
  final Animation<double> scaleAnimationYT;
  const TipInputMode({
    required this.controller,
    required this.scaleAnimationX,
    required this.scaleAnimationY,
    required this.scaleAnimationXT,
    required this.scaleAnimationYT,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.forward(),

      child: _containerAnimationBuilder(),
    );
  }

  ///动画组件
  Widget _containerAnimationBuilder() {
    return Column(children: [_texyContainer(), _animationIcon()]);
  }

  ///文字动画
  Widget _texyContainer() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.diagonal3Values(
            ///这个值控制X
            scaleAnimationXT.value,

            ///这个值控制Y
            scaleAnimationYT.value,
            1.0,
          ),
          child: Container(
            child: Column(children: [noDataText(), tipStartLedgerText()]),
          ),
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
      margin: EdgeInsets.only(top: 8.sw),
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

  ///TODO 未来要抽出并为其写点击逻辑
  ///一个快速记录的动画ICon
  Widget _animationIcon() {
    return Expanded(
      child: Transform(
        alignment: Alignment.bottomCenter,
        transform: Matrix4.diagonal3Values(
          ///这个值控制X
          scaleAnimationX.value,

          ///这个值控制Y
          scaleAnimationY.value,
          1.0,
        ),
        child: Container(
          padding: EdgeInsets.all(15.sw),
          alignment: Alignment.center,
          child: Lottie.asset(LedgerChoiceTypeItems.lottieJsons[0]),
        ),
      ),
    );
  }
}
