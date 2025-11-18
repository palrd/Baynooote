import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/animation_set/CompletedAniamtionSet.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/animation_set/CompletedAniamtionSet2.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/animation_set/PlaceholderAnimationSet.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_ready_inputData_placeholder.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_show_input_line.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_record_completed/ledger_show_record_completed.dart';

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
    with TickerProviderStateMixin {
  ///准备动画控制器
  late AnimationController _controller;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late Placeholderanimationset _anim;
  late Completedaniamtionset _anim2;
  late Completedaniamtionset2 _anim3;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    ///初始化动画控制器
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1800),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    final vm = context.read<QuickAnimationActiveState>();
    final index = vm.selectedIndexActiveState;
    vm.addListener(() {
      final newIndex = vm.selectedIndexActiveState;
      _anim.rebuild(_controller, newIndex);
    });
    _anim = Placeholderanimationset(_controller, index);
    _anim2 = Completedaniamtionset(_controller2);
    _anim3 = Completedaniamtionset2(_controller3);
  }

  @override
  Widget build(BuildContext context) {
    ///外层容器
    return Selector<ConfirmButtonState, int>(
      builder: (context, inputState, child) {
        if (inputState == 2) {
          _controller.forward();
        } else if (inputState == 4) {
          _controller2.forward();
          Future.delayed(
            Duration(milliseconds: 700),
            () => _controller3.forward(),
          );
        }
        return _showSwich();
      },
      selector: (context, vm) => vm.inputState,
    );
  }

  Widget _showSwich() {
    return AnimatedBuilder(
      animation: _controller2,
      builder: (context, _) {
        return Stack(
          alignment: Alignment.center,
          children: [_showLedgerRecordCompleted(), _buildContainer()],
        );
      },
    );
  }

  Widget _showLedgerRecordCompleted() {
    final vm = context.read<RecordCompletedViewModel>();
    return _anim2.scaleBX.value == 0
        ? SizedBox.shrink()
        : Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 30.sw),
              child: Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.diagonal3Values(
                  _anim2.scaleBX.value,
                  _anim2.scaleBY.value,
                  1.0,
                )..rotateY(_anim2.rotateXB.value),
                child: LedgerShowRecordCompleted(vm: vm, anim: _anim3),
              ),
            ),
          );
  }

  Widget _buildContainer() {
    return _anim2.scaleX.value > 0
        ? AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
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
                      return Align(
                        alignment: _anim.jumpAlign.value,
                        child: Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.diagonal3Values(
                            _anim2.scaleX.value,
                            _anim2.scaleY.value,
                            1.0,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                              top: _anim.jumpMargin.value.sw,
                            ),
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
                                    LedgerChoiceTypeItems
                                        .iconColorsaBegin[index],
                                    LedgerChoiceTypeItems.iconColorsaEnd[index],
                                  ],
                                  begin: AlignmentGeometry.topCenter,
                                  end: AlignmentGeometry.bottomCenter,
                                ),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ///默认展示提示用户对于今日记账的输入
                                  _anim.scaleAnimationXA.value == 0.0
                                      ? SizedBox.shrink()
                                      : LedgerReadyInputdataPlaceholder(
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
                            ),
                          ),
                        ),
                      );
                    },
                    selector: (_, vm) => vm.selectedIndexActiveState,
                  ),
                ),
              );
            },
          )
        : SizedBox.shrink();
  }

  Widget _showIcon() {
    if (_anim.scaleAnimationXB.value > 0.0) {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _anim.scaleAnimationXB.value,
          _anim.scaleAnimationYB.value,
          1.0,
        ),
        child: LedgerShowInputLine(),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
