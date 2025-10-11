import 'package:baynooote/features/ledger/presentetion/view_models/animation_active_state.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/size_get_new.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_quick_input/type_choice_item.dart';
import 'package:flutter/material.dart';

///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

////类型选择条
class TypeChoiceBar extends StatelessWidget {
  const TypeChoiceBar({super.key});

  @override
  Widget build(BuildContext context) {
    ///用来提示动画组件需要rebuild
    final sizeVm = context.watch<SizeGetNew>();

    return Container(
      height: 50.sw,
      padding: EdgeInsets.only(
        left: 15.sw,
        top: 8.sw,
        bottom: 8.sw,
        right: 15.sw,
      ),
      child: Container(
        child: Stack(
          children: [
            TheChoicer(key: ValueKey(sizeVm.isNewSize)),
            Row(children: [TypeWithTime(), TypeChoiceScrollBar()]),
          ],
        ),
      ),
    );
  }
}

///该组件就是选择示意的组件
///它的作用是用来示意哪一个类型被选中了
///长宽由它的目标组件确定
///位置利用margin来确定
///确定一下动画步进流程
///1.当用户点击具体选择条中的某一个类型时，选择器就先向目标类型的水平位置移动
///2.当选择器向目标位置移动到目标容器最外侧时，选择器变形，透明度下降直到为0
///3.此时目标位置的容器背景需要变色
class TheChoicer extends StatefulWidget {
  const TheChoicer({super.key});

  @override
  State<TheChoicer> createState() => _TheChoicerState();
}

///在此混入SingleTickerProviderStateMixin以便于后续的动画
class _TheChoicerState extends State<TheChoicer> with TickerProviderStateMixin {
  ///首先是动画的控制器
  late AnimationController _controller;

  ///容器的位置动画绑定
  late Animation<double> _positionAnimation1;
  late Animation<double> _positionAnimation2;

  ///容器的宽度
  late Animation<double> _widthAnimation;

  ///容器的圆角动画绑定
  late Animation<double> _borderRadiusAnimation;

  ///容器的透明度动画绑定
  late Animation<double> _opacityAnimation;

  ///初始化状态
  @override
  void initState() {
    super.initState();

    ///调用一次
    _initAnimation();
  }

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    ///开始为各个属性添加动画并绑定曲线
    ///第一步进到目标容器边缘
    ///到边缘
    _positionAnimation1 = Tween<double>(begin: 0, end: 5.sw).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.3, curve: Curves.easeInCubic),
      ),
    );

    ///开始变宽
    _widthAnimation = Tween<double>(begin: 30.sw, end: 170.sw).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.3, 1.0, curve: Curves.easeInOutCubic),
      ),
    );

    ///第二步开始变形
    _borderRadiusAnimation = Tween<double>(begin: 10.sw, end: 20.sw).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.6, curve: Curves.easeInOutCubic),
      ),
    );

    ///移动到目标位置
    _positionAnimation2 = Tween<double>(begin: 5.sw, end: 35.sw).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    ///第三步开始透明度下降
    _opacityAnimation = Tween<double>(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1.0, curve: Curves.easeInCubic),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AnimationActiveState>();

    ///判定动画状态
    if (vm.typeChoiceBarActiveState) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return AnimationBuilderContainer();
      },
    );
  }

  Widget AnimationBuilderContainer() {
    ///两个阶段的动画连接
    double _left = _controller.value < 0.3
        ? _positionAnimation1.value
        : _positionAnimation2.value;
    return Opacity(
      opacity: _opacityAnimation.value,
      child: Container(
        ///绑定位置移动
        margin: EdgeInsets.only(left: _left),
        decoration: BoxDecoration(
          color: const Color.fromARGB(80, 197, 201, 204),
          borderRadius: BorderRadius.circular(_borderRadiusAnimation.value),
        ),

        ///绑定宽度
        width: _widthAnimation.value,
        height: 30.sw,
        child: Center(),
      ),
    );
  }
}

///按照时间推荐类型
class TypeWithTime extends StatelessWidget {
  const TypeWithTime({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AnimationActiveState>();
    return _timeWidget();
  }

  Widget _timeWidget() {
    ///不启用背景圆环
    return TypeChoiceItem(
      iconName: LedgerChoiceTypeItems.icons[0],
      index: 0,
      isUseOpcityContainer: false,
      isTime: false,
    );
  }
}

///具体类型选择
class TypeChoiceScrollBar extends StatelessWidget {
  const TypeChoiceScrollBar({super.key});

  @override
  Widget build(BuildContext context) {
    final activeVM = context.watch<AnimationActiveState>();
    return typeChoiceBarExpanded();
  }

  Widget typeChoiceBarExpanded() {
    return Expanded(
      child: Container(
        height: 30.sw,
        padding: EdgeInsets.only(left: 5.sw, right: 5.sw),
        margin: EdgeInsets.only(left: 5.sw),
        decoration: BoxDecoration(
          color: const Color.fromARGB(30, 197, 201, 204),
          borderRadius: BorderRadius.circular(20.sw),
        ),
        clipBehavior: Clip.hardEdge,
        child: horizontalRow(),
      ),
    );
  }

  Widget horizontalRow() {
    ///TODO 将来需要变成可横向滚动
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(LedgerChoiceTypeItems.icons.length - 1, (index) {
        return TypeChoiceItem(
          iconName: LedgerChoiceTypeItems.icons[index + 1],
          index: index + 1,
          isTime: true,
        );
      }),
    );
  }
}
