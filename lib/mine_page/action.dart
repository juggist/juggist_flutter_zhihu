import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MineAction { updatePinedBarStatus }

class MineActionCreator {
  static Action updatePinedBarStatus(int pinedBarStatus) {
    return Action(MineAction.updatePinedBarStatus,payload: pinedBarStatus);
  }
}
