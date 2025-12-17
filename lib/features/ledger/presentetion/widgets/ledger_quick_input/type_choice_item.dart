///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:flutter_svg/flutter_svg.dart';

////可选择的单个icon
class TypeChoiceItem extends StatefulWidget {
  final IconData iconName;
  final int index;
  final bool isUseOpcityContainer;
  final bool isTime;
  final int animateDuration;

  const TypeChoiceItem({
    required this.iconName,
    required this.index,
    this.isTime = false,
    this.isUseOpcityContainer = true,
    this.animateDuration = 200,
    super.key,
  });

  @override
  State<TypeChoiceItem> createState() => _TypeChoiceItemState();
}

///这里的动画：
///1.被点击时，icon的透明度改变
///2.被点击时，icon的背景色展示又消失
class _TypeChoiceItemState extends State<TypeChoiceItem>
    with SingleTickerProviderStateMixin {
  ///用来管理选中背景的控制器
  AnimationController? _controllerInvok;

  ///统一曲线
  late CurvedAnimation _curvedAnimation;

  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    ///对两个动画控制器进行初始化
    ///对于这个是否拥有渐隐动画，通过判断是否需要来决定是否初始化，否则浪费资源
    if (widget.isUseOpcityContainer) {
      initInvokAnimationController();
    }
  }

  void initInvokAnimationController() {
    _controllerInvok = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
      reverseDuration: const Duration(milliseconds: 500),
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controllerInvok!,
      curve: Curves.decelerate,
    );

    ///控制背景透明度
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_curvedAnimation);

    _controllerInvok?.addStatusListener((status) {
      if (_controllerInvok?.status == AnimationStatus.completed) {
        _controllerInvok?.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return itemAnimationBuilder();
  }

  Widget itemAnimationBuilder() {
    if (widget.isUseOpcityContainer) {
      return Stack(children: [_choicer(), _buildIcon()]);
    } else {
      return _buildIcon();
    }
  }

  ///是否执行被选中动画的核心是一个bool值isChoice
  ///这个bool值需要通过对储存在动画中的selectedIndexActiveState和当前index进行对比
  ///当点击时，向vm中调用更新index的方法，使得selectedIndexActiveState等于这个被选中index
  ///接下来判断icon组件内的index和vm中的selecedIndex是否相等
  ///若结果为真，那么1.0
  ///若结果为假，那么回到0.5，或者保持不动

  Widget _buildIcon() {
    return Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
      child: Selector<QuickAnimationActiveState, bool>(
        shouldRebuild: (previous, next) => previous != next,
        builder: (_, isChoice, _) {
          final vm = context.read<QuickAnimationActiveState>();
          final vm2 = context.read<ConfirmButtonState>();
          return AnimatedOpacity(
            opacity: isChoice ? 1.0 : 0.5,
            duration: const Duration(milliseconds: 280),
            child:
                SvgPicture.asset(
                  LedgerChoiceTypeItems.svgs[widget.index],
                  width: 23,
                  height: 23,
                  colorFilter: ColorFilter.mode(
                    isChoice ? Color(0xFF2E96DF) : AppTheme.typeIconColor,
                    BlendMode.srcIn,
                  ),
                ).addTapFeel(
                  onTap: () {
                    _controllerInvok?.forward();
                    if (widget.isTime != vm.typeChoiceBarActiveState) {
                      vm.changeTypeChoiceBarActiveState(widget.isTime);
                    }

                    ///更新index
                    vm.changeSelectedIndexActiveState(widget.index);
                    if (vm2.inputState == 0 || vm2.inputState == 4) {
                      vm2.changeState(2);
                    }
                  },
                ),
          );
        },
        selector: (_, vm) => widget.index == vm.selectedIndexActiveState,
      ),
    );
  }

  Widget _choicer() {
    return AnimatedBuilder(
      animation: _controllerInvok!,
      builder: (context, _) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 197, 201, 204),
              shape: BoxShape.circle,
            ),
            width: 35,
            height: 35,
            child: Center(),
          ),
        );
      },
    );
  }
}
