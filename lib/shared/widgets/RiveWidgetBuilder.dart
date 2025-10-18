import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

typedef RiveWidgetCallBack =
    void Function(Artboard artboard, StateMachineController? controller);

///这个组件用来生成一个Rive组件
class Rivewidgetbuilder extends StatefulWidget {
  final String fileURL;
  final String stateMachineName;
  final RiveWidgetCallBack? onInit;
  final BoxFit fit;

  ///  * [fileURL].riv的文件路径
  ///  * [stateMachineName] 状态机名称
  ///  * [onInit]回调函数
  const Rivewidgetbuilder({
    required this.fileURL,
    required this.stateMachineName,
    this.onInit,
    this.fit = BoxFit.contain,
    super.key,
  });

  @override
  State<Rivewidgetbuilder> createState() => _RivewidgetbuilderState();
}

class _RivewidgetbuilderState extends State<Rivewidgetbuilder> {
  Artboard? _artboard;
  StateMachineController? _controller;
  SMIInput? _state;

  Future<void> _loadRive() async {
    ///先去读取文件
    final bytes = await rootBundle.load(widget.fileURL);

    ///接下来将文件放进rivefile
    final riveFile = RiveFile.import(bytes);

    ///拿到画板
    final artboard = riveFile.mainArtboard;

    ///如果有状态机，那就继续寻找状态机

    ///尝试找状态机

    final ctrl = StateMachineController.fromArtboard(
      artboard,
      widget.stateMachineName,
    );
    if (ctrl != null) {
      artboard.addController(ctrl);
    }

    widget.onInit?.call(artboard, ctrl);

    ///最后更新
    setState(() {
      _artboard = artboard;
      _controller = ctrl;
    });
  }

  @override
  void initState() {
    _loadRive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_artboard == null) {
      return Center();
    }

    return Rive(artboard: _artboard!);
  }
}
