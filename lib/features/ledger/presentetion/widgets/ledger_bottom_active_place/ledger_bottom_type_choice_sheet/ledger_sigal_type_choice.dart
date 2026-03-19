import 'package:baynooote/features/ledger/presentetion/view_models/bus/bottom_type_bus.dart';
import 'package:baynooote/shared/widgets/baynooote_choice_Container.dart';
import 'package:flutter/material.dart';

class LedgerSigalTypeChoice extends StatelessWidget {
  final int index;
  const LedgerSigalTypeChoice({required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaynoooteChoiceContainer(
            listenValue: BottomTypeBus.selectedIndex,
            value: index,
            onTap: (){
              BottomTypeBus.setSlectedIndex(index);
            },
            icon: Icon(Icons.woo_commerce, size: 30, color: Colors.white),
            containerWidth: 70,
            containerHeight: 70,
            borderWidth: 5,
            backgroundColor: Color(0xFF50A7EA),
            
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              "午餐",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF50A7EA),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
