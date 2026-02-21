import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/shared/animation_set/InputLineAnimationSet.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/clip_line.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_call_def_name_bar_up.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_detail_record.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_input_amount.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_show_count_type.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/show_animation_icon.dart';

class LedgerShowInputLine extends StatelessWidget {
  final Inputlineanimationset anim;
  const LedgerShowInputLine({required this.anim, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 95,
            top: 0,
            bottom: 0,
            child: _leftWrapper(),
          ),
          _rightWrapper(),
        ],
      ),
    );
  }

  ///右侧包裹
  Widget _rightWrapper() {
    return AnimatedBuilder(
      animation: anim.controller,
      child: Container(
        width: 95,
        margin: EdgeInsets.only(top: 5),
        child: Column(
          children: [
            ShowAnimationIcon(),
            Expanded(
              child: AnimatedBuilder(
                animation: anim.controller,
                child: Container(
                  alignment: Alignment.center,
                  width: 95,
                  margin: EdgeInsets.only(top: 5),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.center,
                    child: LedgerCallDefNameBarUp(),
                  ),
                ),
                builder: (_, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.diagonal3Values(
                      anim.scaleAfter5.value,
                      anim.scaleAfter5.value,
                      1.0,
                    ),
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      builder: (_, child) {
        return Align(alignment: anim.alignment.value, child: child);
      },
    );
  }

  ///左侧包裹
  Widget _leftWrapper() {
    return AnimatedBuilder(
      animation: anim.controller,
      child: Container(
        child: Column(
          children: [
            Expanded(flex: 3, child: _topWrapper()),
            Expanded(flex: 7, child: _lineDESCWrapper()), // 自动扩展
          ],
        ),
      ),
      builder: (_, child) {
        return Transform.scale(
          alignment: Alignment.centerLeft,
          scaleX: anim.scaleX.value,
          scaleY: 1.0,
          child: child,
        );
      },
    );
  }

  ///因为要自动扩展高度
  ///所以用一个容器包裹线条和记录器
  Widget _lineDESCWrapper() {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          ClipLine(),
          Expanded(child: LedgerDetailRecord(anim: anim)),
        ],
      ),
    );
  }


  Widget _topWrapper() {
    return Container(
      alignment: Alignment.centerLeft,
      height: 40,
      child: Row(
        children: [
          AnimatedBuilder(
            animation: anim.controller,
            child: LedgerShowCountType(),
            builder: (_, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..scaleByDouble(
                    anim.scaleAfter1.value,
                    anim.scaleAfter1.value,
                    1.0,
                    1.0,
                  )
                  ..rotateX(anim.rotateXAfter1.value),
                child: child,
              );
            },
          ),

          AnimatedBuilder(
            animation: anim.controller,
            child: LedgerInputAmount(),
            builder: (_, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..scaleByDouble(
                    anim.scaleAfter4.value,
                    anim.scaleAfter4.value,
                    1.0,
                    1.0,
                  )
                  ..rotateX(anim.rotateXAfter4.value),
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}
