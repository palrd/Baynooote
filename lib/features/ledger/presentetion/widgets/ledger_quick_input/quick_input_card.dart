import 'package:baynooote/features/ledger/presentetion/widgets/ledger_quick_input/type_choice_bar.dart';


///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

////组件导入
import 'money_input_field.dart';

import 'confirm_button.dart';

////卡片容器
class QuickInputCard extends StatelessWidget {
  const QuickInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.sw),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(14, 0, 0, 0),
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 10.sw),
      height: 100.sw,

      ///在卡片内部首先分为左右两部分
      child: Row(children: [inputSection(), ConfirmButton()]),
    );
  }
}

///左侧的记账信息输入区域
class inputSection extends StatelessWidget {
  const inputSection({super.key});

  @override
  Widget build(BuildContext context) {
    ///因为要分左右区域所以使用Expanded
    return Expanded(
      flex: 7,
      child: Column(
        mainAxisSize: MainAxisSize.min,

        ///为左侧的上下两层写 Widget
        children: [TypeChoiceBar(), moneyCountInput()],
      ),
    );
  }
}
