import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ItemAction { onOperate,shield,onSetting,onReport }

class ItemActionCreator {
  static Action onOperateAction() {
    return const Action(ItemAction.onOperate);
  }
  static Action shieldAction(String uniqueId) {
    return Action(ItemAction.shield,payload: uniqueId);
  }
  static Action onSettingAction() {
    return const Action(ItemAction.onSetting);
  }
  static Action onReportAction() {
    return const Action(ItemAction.onReport);
  }
}
