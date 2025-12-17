import 'package:baynooote/features/ledger/presentetion/widgets/ledger_quick_input/animation_theChoicer.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_quick_input/type_choice_item.dart';

///依赖导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

////类型选择条
class TypeChoiceBar extends StatelessWidget {
  const TypeChoiceBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 15, top: 8),
      child: Container(
        child: Stack(
          children: [
            TheChoicer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [TypeWithTime(), TypeChoiceScrollBar()],
            ),
          ],
        ),
      ),
    );
  }
}

///按照时间推荐类型
class TypeWithTime extends StatelessWidget {
  const TypeWithTime({super.key});

  @override
  Widget build(BuildContext context) {
    return _timeWidget();
  }

  Widget _timeWidget() {
    ///不启用背景圆环
    return TypeChoiceItem(
      iconName: LedgerChoiceTypeItems.icons[0],
      index: 0,
      isUseOpcityContainer: false,
      isTime: false,
      animateDuration: 270,
    );
  }
}

///具体类型选择
class TypeChoiceScrollBar extends StatelessWidget {
  const TypeChoiceScrollBar({super.key});

  @override
  Widget build(BuildContext context) {
    return typeChoiceBarExpanded();
  }

  Widget typeChoiceBarExpanded() {
    return Expanded(
      child: Container(
        height: 35,
        margin: EdgeInsets.only(left: 12.5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(30, 197, 201, 204),
          borderRadius: BorderRadius.circular(20),
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
