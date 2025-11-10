import 'package:baynooote/features/ledger/di/ledger_module.dart';
import 'package:baynooote/features/ledger/presentetion/view_models/detail_record_view_model.dart';

///该组件用于记录记账详细
class LedgerDetailRecord extends StatefulWidget {
  const LedgerDetailRecord({super.key});

  @override
  State<LedgerDetailRecord> createState() => _LedgerDetailRecordState();
}

class _LedgerDetailRecordState extends State<LedgerDetailRecord> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      context.read<DetailRecordViewModel>().changeMaxLine(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<DetailRecordViewModel, int>(
      builder: (_, maxLine, _) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(),
          child: TextFormField(
            onTap: () {
              final vm = context.read<DetailRecordViewModel>();
              if (vm.scale == 1.0) {
                vm.changeScale(0.0);
                vm.changeHeight(20.0);
                Future.delayed(
                  const Duration(milliseconds: 150),
                  () => vm.changeMaxLine(4),
                );
              } else {
                vm.changeScale(1.0);
                vm.changeHeight(50.0);
                vm.changeMaxLine(3);
              }
            },
            showCursor: true,
            cursorColor: Colors.white,
            cursorRadius: Radius.circular(20),
            // readOnly: true, // 禁止输入，不弹键盘
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              shadows: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
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
          ),
        );
      },
      selector: (_, vm) => vm.maxLine,
    );
  }
}
