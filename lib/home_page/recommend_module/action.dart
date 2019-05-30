import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecommendAction { initRect }

class RecommendActionCreator {
  static Action initRectAction(double rootTop,double rootBottom) {
    return Action(RecommendAction.initRect,payload: {"rootTop":rootTop,"rootBottom":rootBottom});
  }
}
