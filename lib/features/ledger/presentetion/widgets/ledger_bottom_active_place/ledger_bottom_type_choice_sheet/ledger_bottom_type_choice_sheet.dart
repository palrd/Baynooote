import 'package:baynooote/features/ledger/presentetion/view_models/bus/bottom_sheet_bus.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_bottom_active_place/ledger_bottom_type_choice_sheet/ledger_sigal_type_choice.dart';
import 'package:baynooote/shared/widgets/baynooote_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LedgerBottomTypeChoiceSheet extends StatelessWidget {
  const LedgerBottomTypeChoiceSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaynoooteBottomSheet(
      BottomSheetType.typeChoice,
      isScrollable: true,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 85),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(childCount: 30, (_, index) {
              return SizedBox(
                height: 100,
                child: LedgerSigalTypeChoice(index: index),
              );
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              mainAxisExtent: 100,
              crossAxisSpacing: 10,
            ),
          ),
        ),
      ],
    );
  }
}
