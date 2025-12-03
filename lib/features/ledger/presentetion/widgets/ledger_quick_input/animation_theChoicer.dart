import 'package:baynooote/features/ledger/di/ledger_module.dart';

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
      reverseDuration: const Duration(milliseconds: 250),
    );

    ///开始为各个属性添加动画并绑定曲线
    ///第一步进到目标容器边缘
    ///到边缘
    _positionAnimation1 = Tween<double>(begin: 0, end: 40).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1.0, curve: Curves.easeInCubic),
      ),
    );

    ///开始变宽
    _widthAnimation = Tween<double>(begin: 30, end: 180).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.6, curve: Curves.easeInOutCubic),
      ),
    );

    ///第二步开始变形
    _borderRadiusAnimation = Tween<double>(begin: 10, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOutCubic),
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
  Widget build(BuildContext context) {
    return Selector<QuickAnimationActiveState, bool>(
      builder: (context, typeChoiceBarActiveState, _) {
        ///判定动画状态
        if (typeChoiceBarActiveState) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return _animationBuilderContainer();
          },
        );
      },

      selector: (context, vm) => vm.typeChoiceBarActiveState,
    );
  }

  Widget _animationBuilderContainer() {
    return Opacity(
      opacity: _opacityAnimation.value,
      child: Container(
        ///绑定位置移动
        margin: EdgeInsets.only(left: _positionAnimation1.value),
        decoration: BoxDecoration(
          color: const Color.fromARGB(80, 197, 201, 204),
          borderRadius: BorderRadius.circular(_borderRadiusAnimation.value),
        ),

        ///绑定宽度
        width: _widthAnimation.value,
        height: 30,
        child: Center(),
      ),
    );
  }
}
