import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum OperateAction { onOperate,shield,onSetting,onReport }

class OperateActionCreator {
  static Action onOperateAction() {
    return const Action(OperateAction.onOperate);
  }
  static Action shieldAction() {
    return const Action(OperateAction.onOperate);
  }
  static Action onSettingAction() {
    return const Action(OperateAction.onOperate);
  }
  static Action onReportAction() {
    return const Action(OperateAction.onOperate);
  }
}
