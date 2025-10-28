import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/detail_record_view_model.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/PlaceholderAnimationSet.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_ready_inputData_placeholder.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_show_input_line.dart';

///该组件是当数据活动区无数据时展示的组件
///核心是一个容器包裹着三个内容，1.暂无记录 2.提示用户如何开始记账 3.一个用于装饰卡通动画
///动画思路
///首先内部盒子压缩关闭消失_action1
///*0.接下来根据用户选择的类型来对盒子的颜色做改变准备，同时按照类型准备好icon
///icon动画出现容器内部*1.  _action2
///在2.的同时，外部盒子开始压缩弹跳到更高的位置，
///在2.的同时，外部盒子的颜色变成0.准备好的颜色

class LedgerDataPlaceholder extends StatefulWidget {
  const LedgerDataPlaceholder({super.key});

  @override
  State<LedgerDataPlaceholder> createState() => _LedgerDataPlaceholderState();
}

class _LedgerDataPlaceholderState extends State<LedgerDataPlaceholder>
    with SingleTickerProviderStateMixin {
  ///准备动画控制器
  late AnimationController _controller;
  late Placeholderanimationset _anim;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    ///初始化动画控制器
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2100),
    );

    final vm = context.read<QuickAnimationActiveState>();
    final index = vm.selectedIndexActiveState;
    vm.addListener(() {
      final newIndex = vm.selectedIndexActiveState;
      _anim.rebuild(_controller, newIndex);
    });
    _anim = Placeholderanimationset(_controller, index);
  }

  @override
  Widget build(BuildContext context) {
    ///外层容器
    return Selector<ConfirmButtonState, int>(
      builder: (context, inputState, _) {
        if (inputState == 2) {
          _controller.forward();
        } else if (inputState == 4) {
          _controller.reverse();
        }
        return _buildContainer();
      },
      selector: (context, vm) => vm.inputState,
    );
  }

  Widget _buildContainer() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        if (_controller.isCompleted) {
          final vm = context.read<DetailRecordViewModel>();
          vm.changeMaxLine(3);
        }
        return Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.diagonal3Values(
            _anim.scaleAnimationXS.value,
            _anim.scaleAnimationYS.value,
            1.0,
          ),
          child: FractionallySizedBox(
            widthFactor: _anim.widthStrech.value,
            child: Selector<QuickAnimationActiveState, int>(
              builder: (_, index, child) {
                return Container(
                  margin: EdgeInsets.only(top: _anim.jump.value.sw),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50.sw * _anim.radiusChange.value,
                    ),
                  ),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: 200.sw,
                    clipBehavior: Clip.hardEdge,
                    padding: EdgeInsets.symmetric(vertical: 10.sw),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        ///颜色过渡
                        colors: [
                          LedgerChoiceTypeItems.iconColorsaBegin[index],
                          LedgerChoiceTypeItems.iconColorsaEnd[index],
                        ],
                        begin: AlignmentGeometry.topCenter,
                        end: AlignmentGeometry.bottomCenter,
                      ),
                    ),
                    child: child,
                  ),
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ///默认展示提示用户对于今日记账的输入
                  LedgerReadyInputdataPlaceholder(
                    controller: _controller,
                    scaleX: _anim.scaleAnimationXA,
                    scaleY: _anim.scaleAnimationYA,
                    scaleXT: _anim.scaleAnimationXAT,
                    scaleYT: _anim.scaleAnimationYAT,
                  ),

                  ///展示icon
                  _showIcon(),
                ],
              ),
              selector: (_, vm) => vm.selectedIndexActiveState,
            ),
          ),
        );
      },
    );
  }

  Widget _showIcon() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.diagonal3Values(
        _anim.scaleAnimationXB.value,
        _anim.scaleAnimationYB.value,
        1.0,
      ),
      child: LedgerShowInputLine(),
    );
  }
}
