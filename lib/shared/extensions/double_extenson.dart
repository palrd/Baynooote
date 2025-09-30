import 'package:baynooote/core/util/size_fit_util.dart';

/// 对double进行扩展，以便于快捷调用单位缩放
extension DoubleExtenson on double {
  //快捷调用缩放
  double get sw => SizeFitUtil.sw(this.toDouble());
  double get sh => SizeFitUtil.sh(this.toDouble());
  double get sp => SizeFitUtil.sw(this.toDouble());
  
}
