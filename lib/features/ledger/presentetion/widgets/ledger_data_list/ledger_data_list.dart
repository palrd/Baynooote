import 'dart:ui';

import 'package:baynooote/features/ledger/di/ledger_module.dart';

class LedgerDataList extends StatelessWidget {
  const LedgerDataList({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return Container(
          // color: Colors.red,
          // padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                DataListInfo(scrollController: scrollController),
                Positioned(top: 0, left: 0, right: 0, child: ListDataTime()),
              ],
            ),
          ),
        );
      },
    );
  }
}

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

class DataListInfo extends StatelessWidget {
  final ScrollController scrollController;
  const DataListInfo({required this.scrollController, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 50)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return SigalLedgerData();
              }, childCount: 10),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
      ),
    );
  }
}

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
      color: Colors.amber,
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
            Container(
              padding: EdgeInsets.only(right: 3),
              child: Text(
                "\$9984.22",
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  fontFamily: 'Qinfen',
                ),
              ),
            ),
            Align(
              alignment: AlignmentGeometry.topCenter,
              child: Container(
                alignment: Alignment.center,
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  color: const Color(0XFF67ABFF),

                  shape: BoxShape.circle,
                ),
                child: Text(
                  "R",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 9,
                    height: 1.0,
                    fontFamily: 'Qinfen',
                    color: Colors.white,
                  ),
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
            alignment: Alignment.topCenter,
            width: 20,
            height: 12,
            margin: EdgeInsets.only(right: 3),
            child: Icon(
              Icons.check,
              size: 11,
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
      color: Colors.red,
      height: 22,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: 5),
            child: Text(
              "这是一个记账",
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
      color: Colors.blue,
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
