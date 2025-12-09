import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'dart:ui';


class ListDataTime extends StatelessWidget {
  const ListDataTime({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: 50,
          color: Colors.white38,
          child: Center(
            child: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Image.asset('assets/images/png/DataTimeDown.png'),
                Image.asset('assets/images/png/DataTimeDown2.png'),
                Text(
                  "2025-12-02",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 123, 177, 62),
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    fontFamily: 'Qinfen',
                  ),
                ),
                Image.asset('assets/images/png/DataTimeUp.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}