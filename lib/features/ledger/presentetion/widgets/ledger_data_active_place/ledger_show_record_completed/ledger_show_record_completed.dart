import 'dart:ui';

import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/animation_set/CompletedAniamtionSet2.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/number_level_light.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/show_animation_icon.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/typeName_show.dart';

class LedgerShowRecordCompleted extends StatelessWidget {
  RecordCompletedViewModel vm;
  Completedaniamtionset2 anim;
  LedgerShowRecordCompleted({required this.vm, required this.anim, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(125.sw),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            width: 250.sw,
            height: 250.sw,
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
            padding: EdgeInsets.all(5.sw),
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
        width: 90.sw,
        height: 90.sw,
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
          height: 50.sw,
          padding: EdgeInsets.all(5.sw),
          child: Text(
            "\$${vm.comfirmedMoney}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.sw,
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
      ),
    );
  }

  ///用来包裹类型名称，数据库，详细，警示灯
  Widget _line3Wrapper() {
    return Container(
      width: 90.sw,
      height: 30.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _typeName(),
          Container(
            height: 25.sw,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 2.sw),
                  width: 30.sw,
                  height: 10.sw,
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
        margin: EdgeInsets.only(top: 3.sw),
        child: TypenameShow(
          text: vm.comfirmedIndex,
          isCompleted: true,
          textColor: Colors.black,
          bgColor: const Color.fromARGB(204, 255, 255, 255),
          witdh: 50.sw,
          height: 22.sw,
          useBlur: false,
          useBold: true,
          fontSize: 14.sw,
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
              width: 12.sw,
              height: 12.sw,
              child: Icon(
                Icons.check_rounded,
                size: 12.sw,
                color: Colors.green,
              ),
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
                  width: 12.sw,
                  height: 12.sw,
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
                        fontSize: 6.sw,
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
          width: 30.sw,
          height: 12.sw,
          lightHeight: 5.5.sw,
          lightWidth: 5.5.sw,
          bgColor: const Color.fromARGB(204, 255, 255, 255),
          confirmIndex: vm.confirmedLightIndex,
        ),
      ),
    );
  }

  ///记录者名称
  Widget _userName() {
    return Container(
      width: 90.sw,
      height: 30.sw,
      child: Row(
        children: [
          _rotateContainer(
            anim.rotateXAfter3,
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              width: 20.sw,
              height: 20.sw,

              child: Icon(
                Icons.alternate_email,
                size: 18.sw,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: _rotateContainer(
              anim.rotateXAfter4,
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sw),
                  color: Colors.black,
                ),
                margin: EdgeInsets.only(left: 2.sw),
                height: 20.sw,
                child: Text(
                  vm.userName,
                  style: TextStyle(
                    fontFamily: 'Qinfen',
                    fontSize: 13.sw,
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
        height: 24.sw,
        width: 90.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${vm.timeUnit}",
              style: TextStyle(
                fontFamily: 'Qinfen',
                height: 1.0,
                fontSize: 19.sp, // 推荐用 sp 而不是 sw
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
                fontSize: 19.sp,
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
