import 'package:fish_redux/fish_redux.dart';

class MineState implements Cloneable<MineState> {
  int pinedBarStatus = 0;
  @override
  MineState clone() {
    return MineState()
    ..pinedBarStatus = pinedBarStatus;
  }
}

MineState initState(Map<String, dynamic> args) {
  return MineState();
}
