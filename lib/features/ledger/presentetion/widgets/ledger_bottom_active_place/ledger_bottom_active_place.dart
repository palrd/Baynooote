import 'package:baynooote/features/ledger/presentetion/widgets/ledger_bottom_active_place/ledger_bottom_type_choice_sheet/ledger_bottom_type_choice_sheet.dart';
import 'package:flutter/material.dart';
import 'package:baynooote/shared/widgets/baynooote_number_keyBoard.dart';

class LedgerBottomActivePlace extends StatelessWidget {
  const LedgerBottomActivePlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [BaynoooteNumberKeyboard(), 
        LedgerBottomTypeChoiceSheet()
        ],
      ),
    );
  }
}
