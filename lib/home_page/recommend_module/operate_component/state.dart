import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/state.dart';

class OperateState implements Cloneable<OperateState> {
  String agreeNum = "0";
  String commentNum = "0";

  OperateState({this.agreeNum = "0", this.commentNum = "0"});

  @override
  OperateState clone() {
    return OperateState()..agreeNum = agreeNum
    ..commentNum = commentNum;
  }
}

OperateState initState(Map<String, dynamic> args) {
  return OperateState();
}

class OperateConnector extends ConnOp<ItemState,OperateState>{

  @override
  OperateState get(ItemState state) {
    return OperateState()..commentNum = state.commentNum
        ..agreeNum = state.agreeNum;
  }
}