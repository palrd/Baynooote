import 'package:baynooote/features/ledger/presentetion/widgets/ledger_quick_input/animation_theChoicer.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_quick_input/type_choice_item.dart';

///依赖导入
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
        height: 30.sw,
        margin: EdgeInsets.only(left: 10.sw),
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
