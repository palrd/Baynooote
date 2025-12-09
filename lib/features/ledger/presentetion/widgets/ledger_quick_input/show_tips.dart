///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/tip_content_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

///记账金额输入区
class ShowTips extends StatelessWidget {
  const ShowTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, bottom: 8, right: 15),
      height: 50,
      child: Row(children: [ShowTipsIcon(), ShowTipsText()]),
    );
  }
}

class ShowTipsIcon extends StatelessWidget {
  const ShowTipsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(
          color: LedgerChoiceTypeItems.iconColorsaBegin[0],
          width: 2,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/svgs/animals/dog.svg',
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(
            LedgerChoiceTypeItems.iconColorsaBegin[0],
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class ShowTipsText extends StatelessWidget {
  const ShowTipsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Selector<TipContentViewModel, String>(
              builder: (_, content, _) {
                return Text(
                  content,
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 44, 149, 219),
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
              selector: (_, vm) => vm.content,
            ),
          ],
        ),
      ),
    );
  }
}
