import 'dart:ui';

import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/bus/bottom_sheet_bus.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/confirm_button_state.dart';
import 'package:baynooote/shared/animation_set/CompletedAniamtionSet.dart';
import 'package:baynooote/shared/animation_set/CompletedAniamtionSet2.dart';
import 'package:baynooote/shared/animation_set/CompletedAnimationSet3.dart';
import 'package:baynooote/shared/animation_set/InputLineAnimationSet.dart';
import 'package:baynooote/shared/animation_set/PlaceholderAnimationSet.dart';
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
  late AnimationController _controller4;
  late AnimationController _controller5;
  late Placeholderanimationset _anim;
  late Completedaniamtionset _anim2;
  late Completedaniamtionset2 _anim3;
  late Completedanimationset3 _anim4;
  late Inputlineanimationset _anim5;

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    ///初始化动画控制器
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1400),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _controller4 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller5 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _anim = Placeholderanimationset(_controller);
    _anim2 = Completedaniamtionset(_controller2);
    _anim3 = Completedaniamtionset2(_controller3);
    _anim4 = Completedanimationset3(_controller4);
    _anim5 = Inputlineanimationset(_controller5);
    final vmButton = context.read<ConfirmButtonState>();
    vmButton.addListener(() {
      if (vmButton.inputState == 2) {
        _controller.forward();
      } else if (vmButton.inputState == 4) {
        _controller2.forward();
      }
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller5.forward();
      }
    });
    _controller5.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // _controller2.forward();
        BottomSheetBus.bottomSheetNow.value = BottomSheetType.numberKeyBoard;
      }
    });
    _controller2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // _controller3.forward();
      }
    });
    _controller3.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 300), () {
          // _controller4.forward();
        });
      }
    });
    _controller4.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller2.reset();
        _controller3.reset();
        _controller4.reset();
        _controller5.reset();
        // AnimationBus.listAnimationBus.value = AnimationBusType.activate;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///外层容器
    return Stack(children: [_showLedgerRecordCompleted(), _buildScaleBox()]);
  }

  ///这里是controller4监听点
  Widget _showLedgerRecordCompleted() {
    final vm = context.read<RecordCompletedViewModel>();
    return AnimatedBuilder(
      animation: _controller4,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.centerLeft,
          transform: Matrix4.diagonal3Values(
            _anim4.scaleX.value,
            _anim4.scaleY.value,
            1.0,
          )..setTranslationRaw(_anim4.offsetX.value, 0.0, 0.0),
          child: child,
        );
      },

      ///隔离点
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: 30),

          ///这里需要听controller2的后半部分
          child: AnimatedBuilder(
            animation: _controller2,

            ///隔离
            child: LedgerShowRecordCompleted(vm: vm, anim: _anim3),
            builder: (_, child) {
              return Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.diagonal3Values(
                  _anim2.scaleBX.value,
                  _anim2.scaleBY.value,
                  1.0,
                )..rotateY(_anim2.rotateXB.value),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }

  ///这个负责完成controller2的前半部分
  Widget _buildScaleBox() {
    return AnimatedBuilder(
      animation: _controller2,

      ///隔离点
      child: _buildContainer(),
      builder: (_, child) {
        return Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.diagonal3Values(
            _anim2.scaleX.value,
            _anim2.scaleY.value,
            1.0,
          ),
          child: child,
        );
      },
    );
  }

  ///这里只负责听controller1
  Widget _buildContainer() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()
            ..scaleByDouble(
              _anim.scaleAnimationXS.value,
              _anim.scaleAnimationYS.value,
              1.0,
              1.0,
            )
            ..translateByDouble(0.0, _anim.jumpMargin.value, 0.0, 1.0),
          child: Align(
            alignment: _anim.jumpAlign.value,
            child: SizedBox(
              height: 200,
              child: FractionallySizedBox(
                widthFactor: _anim.widthStrech.value,
                child: ClipSmoothRect(
                  radius: SmoothBorderRadius(
                    cornerRadius: 40 * _anim.radiusChange.value,
                    cornerSmoothing: 1,
                  ),

                  ///这一块可以看出来已经和动画无关，或者说这里面组件自己有动画驱动，
                  ///所以我要放到这个AnimatedBuilder的child中做隔离
                  child: child!,
                ),
              ),
            ),
          ),
        );
      },

      ///隔离点，外部容器的controller已经结束，隔离转到内部给小盒子
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Selector<QuickAnimationActiveState, int>(
          builder: (_, index, child) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 200,
              clipBehavior: Clip.hardEdge,
              padding: EdgeInsets.symmetric(vertical: 10),
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
            );
          },

          ///selector的隔离点
          child: Stack(
            alignment: Alignment.center,
            children: [
              ///这个是缩小,组件内自动动画
              LedgerReadyInputdataPlaceholder(anim: _anim),

              ///这个负责放大，但是这里面挂着一个重型组件，
              ///所以我要用AnimatedBuilder做边缘隔离
              ///但是因为它使用的是controller1，
              ///所以我再使用一个Builder，然后做边缘隔离
              AnimatedBuilder(
                animation: _controller,
                builder: (_, child) {
                  return Transform(
                    alignment: Alignment.bottomCenter,
                    transform: Matrix4.diagonal3Values(
                      _anim.scaleAnimationXB.value,
                      _anim.scaleAnimationYB.value,
                      1.0,
                    ),
                    child: child,
                  );
                },

                ///隔离点
                child: LedgerShowInputLine(anim: _anim5),
              ),
            ],
          ),
          selector: (_, vm) => vm.selectedIndexActiveState,
        ),
      ),
    );
  }
}
