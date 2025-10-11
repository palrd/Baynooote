import 'package:baynooote/core/util/size_fit_util.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/size_get_new.dart';

import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_data_active_place.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_header.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_quick_input/ledger_quick_input.dart';

import 'package:baynooote/shared/extensions/app_gradient_theme.dart';
import 'package:baynooote/shared/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LedgerPage extends StatelessWidget {
  static const String routeName = "/ledger";
  int count =0;

  @override
  Widget build(BuildContext context) {
    ///在这里进行尺寸适配初始化
    final size = MediaQuery.of(context).size;
    SizeFitUtil.init(size);
    final vm = context.read<SizeGetNew>();
    

    ///只在尺寸第一次拿到时执行一次
    if (!vm.isNewSize) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vm.setSize(size);
        print("执行次数：$count");
        count ++ ;
      });
    }

    return Scaffold(
      ///底层背景色
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      ///用于提供渐变背景和左右内边距
      body: Stack(
        children: [
          ///下方内容的容器
          centerContentContainer(context),

          ///顶部标签
          Positioned(top: 0, left: 0, right: 0, child: LedgerHeader()),
        ],
      ),
    );
  }

  ///下层的容器
  Widget centerContentContainer(BuildContext context) {
    final gradientTheme = Theme.of(context).extension<AppGradientTheme>();

    ///作为容器，占满屏幕、提供基础的左右padding约束、背景渐变色
    ///其中的内容拆分为单独widget逐个放入
    return Container(
      height: SizeFitUtil.screenHeight,
      padding: EdgeInsets.only(left: 20.sw, right: 20.sw),
      decoration: BoxDecoration(gradient: gradientTheme?.backgroundGradient),
      child: Column(children: [LedgerQuickInput(), LedgerDataActivePlace()]),
    );
  }
}
