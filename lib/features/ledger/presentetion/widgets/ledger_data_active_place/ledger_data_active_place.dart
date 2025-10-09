import 'package:baynooote/features/ledger/presentetion/view_models/data_active_place_view_model.dart';
import 'package:flutter/material.dart';

//依赖注入
import 'package:baynooote/features/ledger/di/ledger_module.dart';

///组件
import 'ledger_noneData_placeholder.dart';

///该组件是数据活动区域的最外层容器
class LedgerDataActivePlace extends StatelessWidget {
  const LedgerDataActivePlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Consumer<DataActivePlaceViewModel>(
          builder: (ctx, vm, _) {
            return vm.hasData ? Container() : LedgerNonedataPlaceholder();
          },
        ),
      ),
    );
  }
}
