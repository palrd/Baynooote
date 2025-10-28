import 'dart:ui';

import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:lottie/lottie.dart';

class LedgerShowInputLine extends StatelessWidget {
  const LedgerShowInputLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20.sw,
        left: 20.sw,
        right: 17.5.sw,
        bottom: 20.sw,
      ),
      child: Selector<QuickAnimationActiveState, int>(
        builder: (_, index, _) {
          return Container(
            child: Row(children: [_leftWrapper(index), _rightWrapper(index)]),
          );
        },
        selector: (_, vm) => vm.selectedIndexActiveState,
      ),
    );
  }

  ///右侧包裹
  Widget _rightWrapper(index) {
    return Expanded(
      flex: 3,
      child: Container(
        alignment: AlignmentGeometry.topCenter,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: LedgerChoiceTypeItems.iconColorsaBegin[index],
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 10,
                color: LedgerChoiceTypeItems.showdowColorsa[index],
                blurStyle: BlurStyle.outer,
              ),
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 10,
                color: const Color.fromARGB(77, 255, 255, 255),
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          duration: Duration(milliseconds: 300),
          child: Container(
            child: Lottie.asset(LedgerChoiceTypeItems.lottieJsons[index]),
          ),
        ),
      ),
    );
  }

  ///左侧包裹
  Widget _leftWrapper(index) {
    return Expanded(
      flex: 7,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [_topWrapper(index), _centerLine(), _inputDESC()],
        ),
      ),
    );
  }

  ///下方的输入详细
  Widget _inputDESC() {
    return Container(child: _desc());
  }

  ///记账描述
  Widget _desc() {
    return TextFormField(
      showCursor: true,
      readOnly: true, // 禁止输入，不弹键盘
      style: TextStyle(fontWeight: FontWeight.w800),
      decoration: InputDecoration(
        hintText: "输入记账详细",
        hintStyle: TextStyle(
          fontSize: AppTheme.thridTitle.sp,
          color: AppTheme.secondaryTitleColor,
          shadows: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(2, 2),
              blurRadius: 4,
            ),
          ],
        ),
        border: InputBorder.none,

        /// 去掉下划线
        isCollapsed: false,

        /// ✅ 关键，去掉TextField默认的内部padding
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

///中间下划线
Widget _centerLine() {
  return Align(
    alignment: AlignmentGeometry.centerLeft,
    child: FractionallySizedBox(
      widthFactor: 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20.sw),
        ),
        child: SizedBox(height: 2.sw),
      ),
    ),
  );
}

///numberT和指示器包裹
Widget _topWrapper(index) {
  return Container(
    child: Row(children: [_numberTWrapper(index), _numberCounter()]),
  );
}

///金额数额指示器
Widget _numberCounter() {
  return Expanded(
    flex: 8,
    child: Container(
      margin: EdgeInsets.only(left: 5.sw),
      height: 55.sw,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 27.sw,
            child: Text(
              "\$",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 45.sw,
                height: 1.0,
                shadows: [
                  BoxShadow(
                    color: const Color.fromARGB(26, 0, 0, 0),
                    offset: Offset(3, 5),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              width: 35.sw,
              child: Text(
                "98",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 45.sw,
                  height: 1.0,
                  shadows: [
                    BoxShadow(
                      color: const Color.fromARGB(26, 0, 0, 0),
                      offset: Offset(3, 5),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

///金额T指示器包裹器
Widget _numberTWrapper(inedx) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: 8.sw),
        _numberT(inedx),
        SizedBox(height: 5.sw),
        _numberTLight(),
      ],
    ),
  );
}

///用于展示金额单位的组件
Widget _numberT(index) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20.sw),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      child: Container(
        padding: EdgeInsets.all(1.sw),
        alignment: Alignment.center,
        width: 36.sw,
        height: 20.sw,
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 247, 247, 247),
          border: Border(bottom: BorderSide(color: Colors.white30)),
        ),
        child: Text(
          LedgerChoiceTypeItems.typeNames[index],
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.sw,
            fontWeight: FontWeight.bold,
            height: 1.0,
            shadows: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(1, 2),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

///金额大小警示灯
Widget _numberTLight() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20.sw),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      child: Container(
        width: 36.sw,
        height: 15.sw,
        padding: EdgeInsets.symmetric(horizontal: 2.sw),
        decoration: BoxDecoration(
          color: const Color.fromARGB(60, 247, 247, 247),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 7.sw,
              height: 7.sw,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Center(),
            ),
            Container(
              width: 7.sw,
              height: 7.sw,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: Center(),
            ),
            Container(
              width: 7.sw,
              height: 7.sw,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Center(),
            ),
          ],
        ),
      ),
    ),
  );
}
