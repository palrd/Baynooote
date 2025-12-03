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
          // padding: EdgeInsets.only(left: 20.sw, right: 20.sw),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.sw),
                topRight: Radius.circular(30.sw),
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
          height: 50.sw,
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
                    fontSize: 30.sw,
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
            SliverPadding(
              padding: EdgeInsetsGeometry.only(left: 20, right: 20),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 50.sw)),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return SigalLedgerData();
              }, childCount: 10),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30.sw)),
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
      width: 90.sw,
      height: 90.sw,
      child: LedgerDataHeader(width: 65, height: 65),
    );
  }

  Widget _right() {
    return Expanded(
      child: Container(
        height: 90.sw,
        padding: EdgeInsets.only(top: 10.sw, bottom: 10.sw, right: 10.sw),
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
      width: width.sw,
      height: height.sw,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.lightGreen, Colors.lightBlue]),
        shape: BoxShape.circle,
      ),
      child: Center(),
    );
  }

  Widget _buildLight() {
    return Container(
      width: 21.sw,
      height: 21.sw,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2.sw),
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
      height: 26.sw,
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
        padding: EdgeInsets.only(right: 1.sw),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(right: 3.sw),
              constraints: BoxConstraints(maxWidth: 130.sw),
              child: Text(
                "\$9984222222444.22",
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.sw,
                  fontFamily: 'Qinfen',
                ),
              ),
            ),
            Align(
              alignment: AlignmentGeometry.topCenter,
              child: Container(
                alignment: Alignment.center,
                width: 13.sw,
                height: 13.sw,
                decoration: BoxDecoration(
                  color: const Color(0XFF67ABFF),

                  shape: BoxShape.circle,
                ),
                child: Text(
                  "R",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                    fontSize: 9.sw,
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
            width: 20.sw,
            height: 12.sw,
            margin: EdgeInsets.only(right: 3.sw),
            child: Icon(
              Icons.check,
              size: 11.sw,
              color: Colors.green,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Align(
          alignment: AlignmentGeometry.topCenter,
          child: Container(
            height: 15.sw,
            child: Text(
              "AM 10:10",
              style: TextStyle(
                fontSize: 12.sw,
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
      height: 22.sw,
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 130.sw),
            padding: EdgeInsets.only(right: 5.sw),
            child: Text(
              "这是一个weggggw记账",
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 16.sw,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.topCenter,
            child: Container(
              width: 25.sw,
              height: 12.sw,
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.sw),
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
      height: 21.sw,
      alignment: Alignment.centerLeft,
      child: Text(
        "LedgerDescLedgerLedgerDescLedgerLedgerDescLedger",
        maxLines: 1,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 15.sw,
          color: const Color.fromARGB(255, 95, 95, 95),
        ),
      ),
    );
  }
}
