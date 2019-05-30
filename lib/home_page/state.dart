import 'package:fish_redux/fish_redux.dart';

class HomeIndexState implements Cloneable<HomeIndexState> {

  @override
  HomeIndexState clone() {
    return HomeIndexState();
  }
}

HomeIndexState initState(Map<String, dynamic> args) {
  return HomeIndexState();
}
