import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:flutter_svg/flutter_svg.dart';

///该组件用于记录记账详细
class LedgerDetailRecord extends StatefulWidget {
  const LedgerDetailRecord({super.key});

  @override
  State<LedgerDetailRecord> createState() => _LedgerDetailRecordState();
}

class _LedgerDetailRecordState extends State<LedgerDetailRecord> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    // border: Border.all(color: Color(0xFF50A7EA), width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(15, 0, 0, 0),
                        offset: Offset(0, 2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: SvgPicture.asset(
                      "assets/svgs/icons/turkey.svg",
                      width: 23,
                      height: 23,
                      colorFilter: ColorFilter.mode(
                        Color(0xFF50A7EA),
                        BlendMode.srcIn,
                      ),
                    ),
                  ).addTapFeel(feelingLevel: 1),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(15, 0, 0, 0),
                            offset: Offset(0, 2),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Text(
                        "记账详细...",
                        style: TextStyle(
                          color: Color(0xFF50A7EA),
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                        ),
                      ),
                    ).addTapFeel(feelingLevel: 1),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      // border: Border.all(color: Color(0xFF50A7EA), width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(15, 0, 0, 0),
                          offset: Offset(0, 2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: SvgPicture.asset(
                        "assets/svgs/icons/calculate.svg",
                        width: 23,
                        height: 23,
                        colorFilter: ColorFilter.mode(
                          Color(0xFF50A7EA),
                          BlendMode.srcIn,
                        ),
                      ),
                    ).addTapFeel(feelingLevel: 1),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 74,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(15, 0, 0, 0),
                                  offset: Offset(0, 2),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Container(
                                height: 8,
                                width: 23,
                                decoration: BoxDecoration(
                                  color: Color(0xFF50A7EA),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(),
                              ),
                            ),
                          ).addTapFeel(feelingLevel: 1),
                          Container(
                            width: 74,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(15, 0, 0, 0),
                                  offset: Offset(0, 2),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 8,
                                    width: 23,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF50A7EA),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(),
                                  ),
                                  Container(
                                    height: 23,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF50A7EA),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(),
                                  ),
                                ],
                              ),
                            ),
                          ).addTapFeel(feelingLevel: 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
