import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/detail_record_view_model.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/clip_line.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_detail_record.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/money_counter.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/number_level_light.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/show_animation_icon.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/typeName_show.dart';

class LedgerShowInputLine extends StatelessWidget {
  const LedgerShowInputLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 17.5,
        bottom: 20,
      ),
      child: Row(children: [_leftWrapper(), _rightWrapper()]),
    );
  }

  ///右侧包裹
  Widget _rightWrapper() {
    return Expanded(
      flex: 3,
      child: Column(
        children: [ShowAnimationIcon(), _rightMoneyCountScaleBox()],
      ),
    );
  }

  ///右侧金额换位伸缩盒子
  Widget _rightMoneyCountScaleBox() {
    return Selector<DetailRecordViewModel, double>(
      builder: (_, scale, _) {
        return TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: (1.0 - scale).abs()),
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            if (value == 0.0) {
              return SizedBox.shrink();
            } else {
              return Transform(
                transform: Matrix4.diagonal3Values(value, value, 1.0),
                alignment: Alignment.centerLeft,
                child: MoneyCounter(fontsize: 25, isSmall: true),
              );
            }
          },
        );
      },
      selector: (_, vm) => vm.scale,
    );
  }

  ///左侧包裹
  Widget _leftWrapper() {
    return Expanded(
      flex: 7,
      child: Column(
        children: [
          _topWrapper(), // 高度随 topScale 改变
          _lineDESCWrapper(), // 自动扩展
        ],
      ),
    );
  }

  ///因为要自动扩展高度
  ///所以用一个容器包裹线条和记录器
  Widget _lineDESCWrapper() {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        child: Container(
          margin: EdgeInsets.only(top: 3),
          child: Column(children: [ClipLine(), LedgerDetailRecord()]),
        ),
      ),
    );
  }

  ///numberT和金额量包裹
  Widget _topWrapper() {
    return Selector<DetailRecordViewModel, double>(
      builder: (_, height, _) {
        return TweenAnimationBuilder(
          tween: Tween(begin: 50.0, end: height),
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return SizedBox(
              height: value,
              child: Row(
                children: [
                  _numberTWrapper(),
                  Expanded(child: _scaleBox()),
                ],
              ),
            );
          },
        );
      },
      selector: (_, vm) => vm.height,
    );
  }

  ///MoneyCounter伸缩盒子
  Widget _scaleBox() {
    return Selector<DetailRecordViewModel, double>(
      builder: (_, scale, _) {
        return TweenAnimationBuilder(
          tween: Tween(begin: 1.0, end: scale),
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            if (value == 0.0) {
              return SizedBox.shrink();
            } else {
              return Transform(
                transform: Matrix4.diagonal3Values(value, value, 1.0),
                alignment: Alignment.centerLeft,
                child: MoneyCounter(fontsize: 45),
              );
            }
          },
        );
      },
      selector: (_, vm) => vm.scale,
    );
  }

  ///记账类型指示器和记账金额等级指示器包裹
  Widget _numberTWrapper() {
    return Container(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [_nameScaleBox(), NumberLevelLight()],
        ),
      ),
    );
  }

  ///记账类型伸缩盒子
  Widget _nameScaleBox() {
    return Selector<DetailRecordViewModel, double>(
      builder: (_, scale, _) {
        return TweenAnimationBuilder(
          tween: Tween(begin: 1.0, end: scale),
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            if (value == 0.0) {
              return SizedBox.shrink();
            } else {
              return Container(
                margin: EdgeInsets.only(
                  top: 10 * value,
                  bottom: 3 * value,
                ),
                child: Transform(
                  transform: Matrix4.diagonal3Values(value, value, 1.0),
                  alignment: Alignment.centerLeft,
                  child: TypenameShow(scale: value),
                ),
              );
            }
          },
        );
      },
      selector: (_, vm) => vm.scale,
    );
  }
}
