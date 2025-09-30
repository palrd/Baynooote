import 'package:baynooote/app/app_text_theme.dart';
import 'package:baynooote/app/app_theme.dart';
import 'package:baynooote/shared/extensions/int_extension.dart';
import 'package:flutter/material.dart';

class LedgerQuickInput extends StatelessWidget {
  const LedgerQuickInput({super.key});

  @override
  Widget build(BuildContext context) {
    //最外层container用于设定上外边距
    return Container(
      margin: EdgeInsets.only(top: 100.sw),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [changeCardState(context), quickInputCard(context)],
      ),
    );
  }

  //这是位于卡片上方的快速记录提示
  Widget changeCardState(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //文字展示
        Text("快速记录", style: AppTextTheme.titleMedium),
        //用来进行间隔
        SizedBox(width: 5.sw),
        //用来切换文字的一个按钮
        Container(
          margin: EdgeInsets.only(top: 3.sw),
          width: 23.sw,
          height: 23.sw,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(0x99),
            borderRadius: BorderRadius.circular(20.sw),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(0x1A),
                offset: Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          child: Icon(
            Icons.keyboard_arrow_right,
            size: 16.sw,
            color: AppTheme.typeIconColor,
          ),
        ),
      ],
    );
  }

  //卡片部分
  Widget quickInputCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.sw),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(0x4C),
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 10.sw),
      height: 100.sw,
      //在卡片内部首先分为左右两部分
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [inputSection(context), stateConfirmIcon()],
      ),
    );
  }

  //左侧的记账信息输入区域
  Widget inputSection(BuildContext context) {
    //因为要分左右区域所以使用Expanded
    return Expanded(
      flex: 7,
      child: Container(
        alignment: Alignment.center,

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [typeChooseBar(), moneyCountInput(context)],
        ),
      ),
    );
  }

  //为左侧的上下两层写 Widget
  //类型选择条
  Widget typeChooseBar() {
    return Container(
      height: 50.sw,
      padding: EdgeInsets.only(top: 8.sw, bottom: 8.sw, right: 20.sw),
      child: Container(
        child: Row(children: [typeWithTime(), typeChoiceScrollBar()]),
      ),
    );
  }

  //按照时间推荐类型
  Widget typeWithTime() {
    return Container(
      margin: EdgeInsets.only(left: 20.sw),
      width: 30.sw,
      height: 30.sw,
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 197, 201, 204),
        borderRadius: BorderRadius.circular(10.sw),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(0x1A),
            offset: Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Icon(
        Icons.access_time,
        size: 20.sw,
        color: AppTheme.typeIconColor,
      ),
    );
  }

  //类型选择区域
  Widget typeChoiceScrollBar() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5.sw),
        height: 30.sw,
        width: double.infinity,
        margin: EdgeInsets.only(left: 5.sw),
        decoration: BoxDecoration(
          color: const Color.fromARGB(22, 197, 201, 204),
          borderRadius: BorderRadius.circular(20.sw),
        ),
        clipBehavior: Clip.hardEdge,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Container(
              margin: EdgeInsets.only(right: 5.sw),
              width: 28.sw,
              height: 28.sw,
              decoration: BoxDecoration(
                // color: AppTheme.unChooseColor.withAlpha(0x4C),
                borderRadius: BorderRadius.circular(28.sw),
              ),
              child: Icon(
                Icons.access_alarm,
                size: 20.sw,
                color: AppTheme.typeIconColor,
              ),
            );
          },
        ),
      ),
    );
  }

  //记账金额输入区
  Widget moneyCountInput(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.sw, bottom: 8.sw, right: 20.sw),
      height: 50.sw,
      child: Container(
        height: 40.sw,
        padding: EdgeInsets.only(left: 20.sw),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(20.sw),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(0x1A),
              offset: Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              hintText: "输入记账金额",
              hintStyle: AppTextTheme.titleLarge,
              border: InputBorder.none, // 去掉下划线
              isCollapsed: true, // ✅ 关键，去掉TextField默认的内部padding
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }

  //边距分配逻辑，底部是13，顶部是13,所以左右两侧是13
  //右侧的状态确认按钮
  Widget stateConfirmIcon() {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.all(13.sw),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(4.sw),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.iconBgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(0x1A),
                  offset: Offset(0, 2),
                  blurRadius: 5,
                ),
              ],
            ),

            child: Center(
              child: Icon(
                Icons.done,
                color: AppTheme.iconColor,
                size: 42.sw,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
