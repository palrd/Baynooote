import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/widgets/ledger_data_active_place/ledger_show_input_line/ledger_show_count_type.dart';

///分左右,用Row
///  左头像
///    一个大头像，堆叠在右下角有一个金额等级警示灯，采用Stack
///  右主要信息展示区
///    首先分上下，用Column
///      上单行
///        Row[金额，细节记录标识，数据库标识，时间标识]
///      下左右，用Row
///        左两行
///         左一Row[标题，类型标记]
///         左二Text[记录时的详细描述]，只能展示一行，超出部分省略号
///        右边一格展示一些小图形或gif
///
class SigalLedgerData extends StatelessWidget {
  const SigalLedgerData({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(children: [_left(), _right()]),
      ],
    );
  }

  Widget _left() {
    return Container(
      alignment: Alignment.center,
      width: 90,
      height: 90,
      child: LedgerDataHeader(width: 65, height: 65),
    );
  }

  Widget _right() {
    return Expanded(
      child: Container(
        height: 90,
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
        child: LedgerDataMainData(),
      ),
    );
  }
}

///左头像
class LedgerDataHeader extends StatelessWidget {
  final double width;
  final double height;
  const LedgerDataHeader({this.width = 40, this.height = 40, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildHeader(),
        Positioned(right: 0, bottom: 0, child: _buildLight()),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.lightGreen, Colors.lightBlue]),
        shape: BoxShape.circle,
      ),
      child: Center(),
    );
  }

  Widget _buildLight() {
    return Container(
      width: 21,
      height: 21,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(),
    );
  }
}

///单个记录的主要信息展示
class LedgerDataMainData extends StatelessWidget {
  const LedgerDataMainData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [DataHeader(), TypeNameAndTitle(), DataDesc()],
      ),
    );
  }
}

class DataHeader extends StatelessWidget {
  const DataHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [_buildCountAndNotice(), _buildDataBaseNoticeAndTimeNotice()],
      ),
    );
  }

  Widget _buildCountAndNotice() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(right: 1),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LedgerShowCountType(width: 16, height: 5),
            Container(
              constraints: BoxConstraints(maxWidth: 120),
              padding: EdgeInsets.only(left: 1, right: 3),
              child: Text(
                "998422222.22",
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  fontFamily: 'Qinfen',
                  height: 1.0,
                ),
              ),
            ),
            Align(
              alignment: AlignmentGeometry.topCenter,
              child: Container(
                alignment: Alignment.center,
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: const Color(0XFF67ABFF),

                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "assets/images/png/recored.png",
                  width: 14,
                  height: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataBaseNoticeAndTimeNotice() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentGeometry.topCenter,
          child: Container(
            alignment: Alignment.bottomCenter,
            width: 20,
            height: 15,
            margin: EdgeInsets.only(right: 3),
            child: Icon(
              Icons.check,
              size: 14,
              color: Colors.green,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Align(
          alignment: AlignmentGeometry.topCenter,
          child: Container(
            height: 15,
            child: Text(
              "AM 10:10",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'Qinfen',
                color: const Color.fromARGB(255, 130, 130, 130),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TypeNameAndTitle extends StatelessWidget {
  const TypeNameAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 150),
            padding: EdgeInsets.only(right: 5),
            child: Text(
              "老板的章鱼烧店铺",
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.topCenter,
            child: Container(
              width: 25,
              height: 12,
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(),
            ),
          ),
        ],
      ),
    );
  }
}

class DataDesc extends StatelessWidget {
  const DataDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      alignment: Alignment.centerLeft,
      child: Text(
        "LedgerDescLedgerLedgerDescLedgerLedgerDescLedger",
        maxLines: 1,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 15,
          color: const Color.fromARGB(255, 95, 95, 95),
        ),
      ),
    );
  }
}
