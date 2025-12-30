import 'package:baynooote/shared/widgets/baynooote_choice_Container.dart';
import 'package:flutter/material.dart';

class LedgerSigalTypeChoice extends StatelessWidget {
  const LedgerSigalTypeChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BaynoooteChoiceContainer(
          icon: Icon(Icons.woo_commerce, size: 30, color: Colors.blue),
          containerWidth: 70,
          containerHeight: 70,
          borderWidth: 5,
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            "午餐",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
