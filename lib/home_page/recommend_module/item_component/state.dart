import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/state.dart';

class ItemComponentState implements Cloneable<ItemComponentState> {
  String userAvatarPath;
  String userName;
  String userPortrait;
  String content;
  String videoPath;
  String picPath;

  ItemComponentState(
      {this.userAvatarPath = "",
      this.userName = "",
      this.userPortrait = "",
      this.content = "",
      this.videoPath = "",
      this.picPath = ""});

  @override
  ItemComponentState clone() {
    return ItemComponentState()
      ..userAvatarPath = userAvatarPath
      ..userName = userName
      ..userPortrait = userPortrait
      ..content = content
      ..videoPath = videoPath
      ..picPath = picPath;
  }
}

ItemComponentState initState(Map<String, dynamic> args) {
  return ItemComponentState();
}

class ItemComponentConecctor extends ConnOp<ItemState,ItemComponentState>{

  @override
  ItemComponentState get(ItemState state) {

    return ItemComponentState().clone()
      ..userAvatarPath = state.userAvatarPath
      ..userName = state.userName
      ..userPortrait = state.userPortrait
      ..content = state.content
      ..videoPath = state.videoPath
      ..picPath = state.picPath;
  }

  @override
  void set(ItemState state, ItemComponentState subState) {
    state.clone()
      ..userAvatarPath = subState.userAvatarPath
      ..userName = subState.userName
      ..userPortrait = subState.userPortrait
      ..content = subState.content
      ..videoPath = subState.videoPath
      ..picPath = subState.picPath;
  }
}
