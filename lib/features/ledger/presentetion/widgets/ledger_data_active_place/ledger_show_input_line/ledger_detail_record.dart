import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/animation_set/InputLineAnimationSet.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_call_detail_sheet_up.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_count_type_button.dart';
import 'package:baynooote/shared/widgets/baynooote_choice_Container.dart';

import 'package:flutter_svg/flutter_svg.dart';

///该组件用于记录记账详细
class LedgerDetailRecord extends StatelessWidget {
  final Inputlineanimationset anim;
  const LedgerDetailRecord({required this.anim, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: AnimatedBuilder(
                      animation: anim.controller,
                      child: BaynoooteChoiceContainer(
                        icon: SvgPicture.asset(
                          "assets/svgs/icons/turkey.svg",
                          width: 23,
                          height: 23,
                          colorFilter: ColorFilter.mode(
                            Color(0xFF50A7EA),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
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
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: AnimatedBuilder(
                        animation: anim.controller,
                        child: LedgerCallDetailSheetUp(),
                        builder: (_, child) {
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..scaleByDouble(
                                anim.scaleAfter2.value,
                                anim.scaleAfter2.value,
                                1.0,
                                1.0,
                              )
                              ..rotateX(anim.rotateXAfter2.value),
                            child: child,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10),
                    child: AnimatedBuilder(
                      animation: anim.controller,
                      child: BaynoooteChoiceContainer(
                        icon: SvgPicture.asset(
                          "assets/svgs/icons/calculate.svg",
                          width: 23,
                          height: 23,
                          colorFilter: ColorFilter.mode(
                            Color(0xFF50A7EA),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
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
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedBuilder(
                            animation: anim.controller,
                            child: LedgerCountTypeButton(
                              icon: SvgPicture.asset(
                                "assets/svgs/icons/calendar.svg",
                                width: 23,
                                height: 23,
                                colorFilter: ColorFilter.mode(
                                  Color(0xFF50A7EA),
                                  BlendMode.srcIn,
                                ),
                              ),
                              title: Text(
                                "日期",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF50A7EA),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            builder: (_, child) {
                              return Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..scaleByDouble(
                                    anim.scaleAfter3.value,
                                    anim.scaleAfter3.value,
                                    1.0,
                                    1.0,
                                  )
                                  ..rotateX(anim.rotateXAfter3.value),
                                child: child,
                              );
                            },
                          ),
                          AnimatedBuilder(
                            animation: anim.controller,
                            child: LedgerCountTypeButton(
                              icon: SvgPicture.asset(
                                "assets/svgs/icons/connection-box.svg",
                                width: 23,
                                height: 23,
                                colorFilter: ColorFilter.mode(
                                  Color(0xFF50A7EA),
                                  BlendMode.srcIn,
                                ),
                              ),
                              title: Text(
                                "关联",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF50A7EA),
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
