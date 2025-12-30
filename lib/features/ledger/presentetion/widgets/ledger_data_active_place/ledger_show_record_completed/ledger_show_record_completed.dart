import 'dart:ui';

import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/animation_set/CompletedAniamtionSet2.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_show_count_type.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/number_level_light.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/show_animation_icon.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/typeName_show.dart';

class LedgerShowRecordCompleted extends StatelessWidget {
  final RecordCompletedViewModel vm;
  final Completedaniamtionset2 anim;
  const LedgerShowRecordCompleted({required this.vm, required this.anim, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(125),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: LedgerChoiceTypeItems.iconColorsaBegin[vm.comfirmedIndex],

              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(57, 0, 0, 0),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                _typeIcon(),
                _moneyNumber(),
                _line3Wrapper(),
                _userName(),
                _recordTime(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///统一旋转容器
  Widget _rotateContainer(Animation<double> rotateX, Widget childOut) {
    return AnimatedBuilder(
      animation: rotateX,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(1.0, 1.0, 1.0)
            ..rotateX(rotateX.value)
            ..setEntry(3, 2, 0.001),
          child: child,
        );
      },
      child: childOut,
    );
  }

  ///记账类型icon
  Widget _typeIcon() {
    return _rotateContainer(
      anim.rotateXAfter1,
      Container(
        width: 90,
        height: 90,
        child: ShowAnimationIcon(index: vm.comfirmedIndex, isCompleted: true),
      ),
    );
  }

  ///金额
  Widget _moneyNumber() {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: _rotateContainer(
        anim.rotateXAfter1,
        Container(
          alignment: Alignment.center,
          height: 50,
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LedgerShowCountType(width: 28, height: 8),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "${vm.comfirmedMoney}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                    fontFamily: 'Qinfen',
                    shadows: [
                      BoxShadow(
                        color: const Color.fromARGB(40, 0, 0, 0),
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///用来包裹类型名称，数据库，详细，警示灯
  Widget _line3Wrapper() {
    return Container(
      width: 90,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _typeName(),
          Container(
            height: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 2),
                  width: 30,
                  height: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [_haveInsertDB(), _isDetail()],
                  ),
                ),
                _moneyNumberLight(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///记账类型名字
  Widget _typeName() {
    return _rotateContainer(
      anim.rotateXAfter2,
      Container(
        margin: EdgeInsets.only(top: 3),
        child: TypenameShow(
          text: vm.comfirmedIndex,
          isCompleted: true,
          textColor: Colors.black,
          bgColor: const Color.fromARGB(204, 255, 255, 255),
          witdh: 50,
          height: 22,
          useBlur: false,
          useBold: true,
          fontSize: 14,
        ),
      ),
    );
  }

  ///是否写入到数据库
  Widget _haveInsertDB() {
    return vm.isInsertDB
        ? _rotateContainer(
            anim.rotateXAfter3,
            Container(
              width: 12,
              height: 12,
              child: Icon(Icons.check_rounded, size: 12, color: Colors.green),
            ),
          )
        : SizedBox.shrink();
  }

  ///是否有记账详细
  Widget _isDetail() {
    return vm.isRecordDetail
        ? Stack(
            alignment: Alignment.center,
            children: [
              _rotateContainer(
                anim.rotateXAfter4,
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 187, 255),
                    shape: BoxShape.circle,
                  ),
                  width: 12,
                  height: 12,
                  child: Center(),
                ),
              ),
              _rotateContainer(
                anim.rotateXAfter3,
                Container(
                  child: Center(
                    child: Text(
                      "R",
                      style: TextStyle(
                        fontFamily: 'Qinfen',
                        color: Colors.white,
                        fontSize: 6,
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : SizedBox.shrink();
  }

  ///金额警示灯
  Widget _moneyNumberLight() {
    return _rotateContainer(
      anim.rotateXAfter2,
      Container(
        child: NumberLevelLight(
          isDetail: true,
          width: 30,
          height: 12,
          lightHeight: 5.5,
          lightWidth: 5.5,
          bgColor: const Color.fromARGB(204, 255, 255, 255),
          confirmIndex: vm.confirmedLightIndex,
        ),
      ),
    );
  }

  ///记录者名称
  Widget _userName() {
    return Container(
      width: 90,
      height: 30,
      child: Row(
        children: [
          _rotateContainer(
            anim.rotateXAfter3,
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              width: 20,
              height: 20,

              child: Icon(Icons.alternate_email, size: 18, color: Colors.white),
            ),
          ),
          Expanded(
            child: _rotateContainer(
              anim.rotateXAfter4,
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                margin: EdgeInsets.only(left: 2),
                height: 20,
                child: Text(
                  vm.userName,
                  style: TextStyle(
                    fontFamily: 'Qinfen',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///记录时间
  Widget _recordTime() {
    return _rotateContainer(
      anim.rotateXAfter4,
      SizedBox(
        height: 24,
        width: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${vm.timeUnit}",
              style: TextStyle(
                fontFamily: 'Qinfen',
                height: 1.0,
                fontSize: 19, // 推荐用 sp 而不是 sw
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  BoxShadow(
                    color: const Color.fromARGB(40, 0, 0, 0),
                    offset: Offset(1, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
            Text(
              vm.confirmedDate,
              style: TextStyle(
                fontFamily: 'Qinfen',
                height: 1.0,
                fontSize: 19,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  BoxShadow(
                    color: const Color.fromARGB(40, 0, 0, 0),
                    offset: Offset(1, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
