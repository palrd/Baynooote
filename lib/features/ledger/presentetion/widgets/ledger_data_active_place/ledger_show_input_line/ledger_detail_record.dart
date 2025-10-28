import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/detail_record_view_model.dart';

///该组件用于记录记账详细
class LedgerDetailRecord extends StatelessWidget {
  const LedgerDetailRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<DetailRecordViewModel,int>(builder: (_,maxLine,_){
      return TextFormField(
      showCursor: true,
      // readOnly: true, // 禁止输入，不弹键盘
      style: TextStyle(fontWeight: FontWeight.w800),
      decoration: InputDecoration(
        hintText: "点击输入记账详细",
        hintStyle: TextStyle(
          fontSize: AppTheme.thridTitle.sp,
          color: const Color.fromARGB(255, 255, 255, 255),
          shadows: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(2, 2),
              blurRadius: 4,
            ),
          ],
        ),
        border: InputBorder.none,
        isCollapsed: false,
        contentPadding: EdgeInsets.zero,
      ),
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: maxLine,
    );
    }, selector: (_,vm)=> vm.maxLine);
  }
}
