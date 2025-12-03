
///私有导入
import 'package:baynooote/features/ledger/di/ledger_module.dart';


///这是位于卡片上方的快速记录提示

class ChangeCardState extends StatelessWidget {
  const ChangeCardState({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ///文字状态展示
        ShowCardStateText(),
        ///用来进行间隔
        SizedBox(width: 5),
        ///暂时不做展示
        ///BtnAndText(),
      ],
    );
  }
}

class BtnAndText extends StatelessWidget {
  const BtnAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          ///状态改变按钮
          ChangeStateButton(),
          ///文字修改区域
          TextChoice(),
        ],
      ),
    );
  }
}

///文字展示
class ShowCardStateText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ///文字展示
    Text("快速记账", style: AppTextTheme.titleMedium);
  }
}

///文字选择区域
class TextChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<StateCardViewModel>(
        builder: (ctx, stVM, _) {
          return Row(children: [bubble(), textShow()]);
        },
      ),
    );
  }

  Widget bubble() {
    return Row(
      children: [theBubble(10, 0), theBubble(10, 0), theBubble(10, 0)],
    );
  }

  Widget theBubble(double size, double position) {
    return Container(
      margin: EdgeInsets.only(top: position),
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(0x99),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(0x1A),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(),
    );
  }

  Widget textShow() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(0x99),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(0x1A),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        ///TODO 可以抽出只计算一次
        margin: EdgeInsets.only(left: 3),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text("记账", style: AppTextTheme.titleMedium),
            Text("笔记", style: AppTextTheme.titleMedium),
            Text("清单", style: AppTextTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

///按钮
class ChangeStateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StateCardViewModel>(
      builder: (ctx, stVM, _) {
        return GestureDetector(
          onTap: () {
            ///展示右侧文字修改选项
            stVM.changeIsShowCardChoice();
            ///调用按钮动画
      
          },
          child: theBotton(),
        );
      },
    );
  }

  Widget theBotton() {
    return ///用来切换文字的一个按钮
    Container(
      margin: EdgeInsets.only(right: 3),

      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(0x99),
        shape: BoxShape.circle,
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
        size: 25,
        color: AppTheme.typeIconColor,
      ),
    );
  }
}
