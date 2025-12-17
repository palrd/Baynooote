import 'package:baynooote/features/ledger/presentetion/view_models/confirm_record_view_model.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/record_collection/record_collection_amount.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_data_active_place.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_list/ledger_data_list.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_header/ledger_header.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_quick_input/ledger_quick_input.dart';

import 'package:baynooote/shared/extensions/app_gradient_theme.dart';

import 'package:baynooote/features/ledger/di/ledger_module.dart';

class LedgerPage extends StatelessWidget {
  static const String routeName = "/ledger";

  const LedgerPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("脚手架重构！");
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          final vm = context.read<RecordCollectionAmountViewModel>();
          if (vm.amount != 0) {
            vm.updateAmount(0.0);
          } else {
            vm.updateAmount(20);
          }
        },
        child: Icon(Icons.add, size: 40),
      ),

      ///底层背景色
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,

      ///用于提供渐变背景和左右内边距
      body: Stack(
        children: [
          ///最底部的背景
          backGround(),

          ///下方内容的容器
          centerContentContainer(context),

          ///顶部标签
          Positioned(top: 0, left: 0, right: 0, child: LedgerHeader()),
        ],
      ),
    );
  }

  Widget backGround() {
    return Positioned.fill(
      child: Image.asset("assets/images/png/wallpaper3.png", fit: BoxFit.cover),
    );
  }

  ///下层的容器
  Widget centerContentContainer(BuildContext context) {
    final gradientTheme = Theme.of(context).extension<AppGradientTheme>();
    print("centerContentContainer重构！");

    ///作为容器，占满屏幕、提供基础的左右padding约束、背景渐变色
    ///其中的内容拆分为单独widget逐个放入
    return Positioned.fill(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: gradientTheme?.backgroundGradient,
            ),
            child: Column(
              children: [LedgerQuickInput(), LedgerDataActivePlace()],
            ),
          ),
          LedgerDataList(),
        ],
      ),
    );
  }
}
