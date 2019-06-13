import 'package:fish_redux/fish_redux.dart';

import 'component/state.dart';

//TODO replace with your own action
enum RecommendAction { updateFocuseIndex}

class RecommendActionCreator {
  static Action updateFocuseIndexAction(int releaseFocuseIndex,int inFocuseIndex) {
    return Action(RecommendAction.updateFocuseIndex,payload: {"releaseFocuseIndex":releaseFocuseIndex,"inFocuseIndex":inFocuseIndex});
  }
}
