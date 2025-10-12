import 'package:baynooote/features/ledger/di/ledger_module.dart';

import 'package:flutter/material.dart';

///该组件是当数据活动区无数据时展示的组件
///核心是一个容器包裹着三个内容，1.暂无记录 2.提示用户如何开始记账 3.一个用于装饰卡通动画

class LedgerNonedataPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    ///外层容器
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.sw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sw),
        gradient: AppTheme.primaryBackgroundGradient2,
      ),
      width: 215.sw,
      height: 200.sw,
      child: Column(
        children: [noDataText(), tipStartLedgerText(), AnimatedIcon()],
      ),
    );
  }

  ///1.暂无记录
  Widget noDataText() {
    return Text(
      "暂无记录...",
      style: TextStyle(
        fontSize: AppTextTheme.bodyMedium.fontSize,
        fontWeight: FontWeight.w800,
        color: AppTheme.iconColor,
        letterSpacing: -0.6,
      ),
    );
  }

  ///提示记录方式,以及开始记录
  Widget tipStartLedgerText() {
    return Container(
      margin: EdgeInsets.only(top: 8.sw),
      child: Text(
        "点击铅笔或点击下方快速记账。",
        style: TextStyle(
          fontSize: AppTextTheme.bodyMedium.fontSize,
          fontWeight: FontWeight.w800,
          color: AppTheme.iconColor,
          letterSpacing: -0.6,
        ),
      ),
    );
  }
}

///3.动画icon
class AnimatedIcon extends StatefulWidget {
  const AnimatedIcon({super.key});

  @override
  State<AnimatedIcon> createState() => _AnimatedIconState();
}

class _AnimatedIconState extends State<AnimatedIcon> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5.sw),
        alignment: Alignment.center,
        child: Image.asset("assets/images/Sleeping.gif"),
      ),
    );
  }
}
