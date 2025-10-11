import 'package:baynooote/features/ledger/presentetion/view_models/animation_active_state.dart';
import 'package:flutter/material.dart';

///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

////可选择的单个icon
class TypeChoiceItem extends StatefulWidget {
  late IconData iconName;
  late int index;
  late bool isUseOpcityContainer;
  late bool isTime;

  TypeChoiceItem({
    required this.iconName,
    required this.index,
    this.isTime = false,
    this.isUseOpcityContainer = true,

    super.key,
  });

  @override
  State<TypeChoiceItem> createState() => _TypeChoiceItemState();
}

///这里的动画：
///1.被点击时，icon的透明度改变
///2.被点击时，icon的背景色展示又消失
class _TypeChoiceItemState extends State<TypeChoiceItem>
    with TickerProviderStateMixin {
  ///用来管理选中背景的控制器
  AnimationController? _controllerInvok;
  late AnimationController _controllerIconOpcity;

  ///统一曲线
  late CurvedAnimation _curvedAnimation1;
  late CurvedAnimation _curvedAnimation2;

  late Animation<double> _opacityAnimation;

  /// 控制背景
  late Animation<double> _colorAnimation;

  @override
  void initState() {
    super.initState();
    final vm = context.read<AnimationActiveState>();

    ///对两个动画控制器进行初始化
    ///对于这个是否拥有渐隐动画，通过判断是否需要来决定是否初始化，否则浪费资源
    if (widget.isUseOpcityContainer) {
      initInvokAnimationController();
    }

    ///icon就默认使用
    initIconAnimationController();

    ///手动监听模型中的变化
    vm.addListener(() {
      ///做一个判断
      bool _isChoice = widget.index == vm.selectedIndexActiveState;

      if (_isChoice) {
        _controllerIconOpcity.forward();
        print("对icon：${widget.index}执行动画启动");
      } else {
        print(
          'item ${widget.index} 失选，当前 value=${_controllerIconOpcity.value}',
        );
        if (_controllerIconOpcity.value > 0.0) {
          _controllerIconOpcity.reverse(from: _controllerIconOpcity.value);
          print("item ${widget.index}执行回溯");
        }
      }
    });
  }

  void initInvokAnimationController() {
    _controllerInvok = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _curvedAnimation1 = CurvedAnimation(
      parent: _controllerInvok!,
      curve: Curves.easeInOutCubic,
    );

    ///控制背景透明度
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_curvedAnimation1);

    _controllerInvok?.addStatusListener((status) {
      if (_controllerInvok?.status == AnimationStatus.completed) {
        _controllerInvok?.reverse();
      }
    });
  }

  void initIconAnimationController() {
    _controllerIconOpcity = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _curvedAnimation2 = CurvedAnimation(
      parent: _controllerIconOpcity,
      curve: Curves.easeInOutCubic,
    );

    ///控制图标透明度
    _colorAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(_curvedAnimation2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerIconOpcity.dispose();
    _controllerInvok?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AnimationActiveState>();
    return GestureDetector(
      onTap: () {
        _controllerInvok?.forward();

        ///可能error
        vm.ChangeTypeChoiceBarActiveState(widget.isTime);

        ///传入index
        vm.ChangeSelectedIndexActiveState(widget.index);
      },
      child: itemAnimationBuilder(),
    );
  }

  Widget itemAnimationBuilder() {
    if (widget.isUseOpcityContainer) {
      return Stack(children: [_Choicer(), _buildIcon()]);
    } else {
      return _buildIcon();
    }
  }

  ///整理一下为被选中的icon提高透明度的逻辑
  ///是否执行被选中动画的核心是一个bool值isChoice
  ///这个bool值需要通过对储存在动画中的selectedIndexActiveState和当前index进行对比
  ///当点击时，向vm中调用更新index的方法，使得selectedIndexActiveState等于这个被选中index
  ///接下来判断icon组件内的index和vm中的selecedIndex是否相等
  ///若结果为真，那么驱动动画向前
  ///若结果为假，那么驱动动画回溯，或保持原始未被选中状态
  ///问题：
  ///我注意到，对于单个item，手势检测是仅针对被点击的icon的，所以原先预想的回溯机制行不会被执行
  ///这个问题的原因是因为执行重构的item只有被选中的才执行，不被选中的则保持状态
  Widget _buildIcon() {
    return AnimatedBuilder(
      animation: _controllerIconOpcity,
      builder: (context, _) {
        return Container(
          width: 30.sw,
          height: 30.sw,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.sw)),
          child: Opacity(
            opacity: _colorAnimation.value,
            child: Icon(
              widget.iconName,
              fontWeight: FontWeight.w300,
              size: 22.sw,
              color: AppTheme.typeIconColor,
            ),
          ),
        );
      },
    );
  }

  Widget _Choicer() {
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
            width: 30.sw,
            height: 30.sw,
            child: Center(),
          ),
        );
      },
    );
  }
}
