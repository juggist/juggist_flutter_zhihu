import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/state.dart';

class AccountInfoState implements Cloneable<AccountInfoState> {
  String userAvatarPath;
  String userName;
  String userPortrait;

  AccountInfoState(
      {this.userAvatarPath = "", this.userName = "", this.userPortrait = ""});

  @override
  AccountInfoState clone() {
    return AccountInfoState()
      ..userAvatarPath = userAvatarPath
      ..userName = userName
      ..userPortrait = userPortrait;
  }
}

AccountInfoState initState(Map<String, dynamic> args) {
  return AccountInfoState();
}

class AccountInfoConnector extends ConnOp<ItemState, AccountInfoState> {
  @override
  AccountInfoState get(ItemState state) {
    return AccountInfoState()
      ..userName = state.userName
      ..userPortrait = state.userPortrait
      ..userAvatarPath = state.userAvatarPath;
  }
}
