import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:rect_getter/rect_getter.dart';

class ItemState implements Cloneable<ItemState> {
  String uniqueId;
  String title;
  String userAvatarPath;
  String userName;
  String userPortrait;
  String content;
  String agreeNum;
  String commentNum;
  String videoPath;
  String picPath;
  GlobalKey rectKey;
  bool firstItemIndex;
  double marginTop;

  ItemState(
      {this.uniqueId,
      this.title,
      this.userAvatarPath,
      this.userName,
      this.userPortrait,
      this.content,
      this.agreeNum,
      this.commentNum,
      this.videoPath,
      this.picPath,
      this.firstItemIndex = false,
      this.marginTop = 0}) {
    uniqueId ??= DateTime.now().toIso8601String();
    this.rectKey ??= RectGetter.createGlobalKey();
  }

  @override
  ItemState clone() {
    return ItemState()
      ..uniqueId = uniqueId
      ..title = title
      ..userAvatarPath = userAvatarPath
      ..userName = userName
      ..userPortrait = userPortrait
      ..content = content
      ..agreeNum = agreeNum
      ..commentNum = commentNum
      ..videoPath = videoPath
      ..picPath = picPath
      ..rectKey = rectKey
      ..firstItemIndex = firstItemIndex
      ..marginTop = marginTop;
  }
}

ItemState initState(Map<String, dynamic> args) {
  return ItemState();
}
