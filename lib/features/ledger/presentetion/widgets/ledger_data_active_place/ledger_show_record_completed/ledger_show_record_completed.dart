import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/number_level_light.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/show_animation_icon.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/typeName_show.dart';

class LedgerShowRecordCompleted extends StatelessWidget {
  const LedgerShowRecordCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.sw,
      height: 250.sw,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 102, 169, 224),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 4),
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
    );
  }

  ///记账类型icon
  Widget _typeIcon() {
    return Container(width: 90.sw, height: 90.sw, child: ShowAnimationIcon());
  }

  ///金额
  Widget _moneyNumber() {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Container(
        alignment: Alignment.center,
        height: 50.sw,
        padding: EdgeInsets.all(5.sw),
        child: Text(
          "\$99999",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.sw,
            fontWeight: FontWeight.bold,
            height: 1.0,
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
    return Container(
      margin: EdgeInsets.only(top: 3.sw),
      child: TypenameShow(
        isCompleted: true,
        textColor: Colors.black,
        bgColor: const Color.fromARGB(204, 255, 255, 255),
        witdh: 50.sw,
        height: 22.sw,
        useBlur: false,
        useBold: true,
        fontSize: 14.sw,
      ),
    );
  }

  ///是否写入到数据库
  Widget _haveInsertDB() {
    return Container(
      width: 8.sw,
      height: 8.sw,
      child: Icon(
        Icons.star_rounded,
        size: 8.sw,
        color: Color.fromARGB(255, 0, 255, 60),
      ),
    );
  }

  ///是否有记账详细
  Widget _isDetail() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 187, 255),
            shape: BoxShape.circle,
          ),
          width: 12.sw,
          height: 12.sw,
          child: Center(),
        ),
        Container(
          child: Center(
            child: Text(
              "R",
              style: TextStyle(
                color: Colors.white,
                fontSize: 6.sw,
                fontWeight: FontWeight.bold,
                height: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  ///金额警示灯
  Widget _moneyNumberLight() {
    return Container(
      child: NumberLevelLight(
        isDetail: true,
        width: 30.sw,
        height: 12.sw,
        lightHeight: 5.5.sw,
        lightWidth: 5.5.sw,
        bgColor: const Color.fromARGB(204, 255, 255, 255),
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
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sw),
                color: Colors.black,
              ),
              margin: EdgeInsets.only(left: 2.sw),
              height: 20.sw,
              child: Text(
                "Paladepa",
                style: TextStyle(
                  fontSize: 13.sw,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.0,
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
  return SizedBox(
    height: 24.sw,
    width: 90.sw,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "PM",
          style: TextStyle(
            height: 1.0,
            fontSize: 22.sp, // 推荐用 sp 而不是 sw
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "8:49",
          style: TextStyle(
            height: 1.0,
            fontSize: 22.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

}
