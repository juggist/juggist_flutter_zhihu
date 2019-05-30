import 'package:fish_redux/fish_redux.dart';
import '../state.dart';

class SearchState implements Cloneable<SearchState> {
  String searchTip;

  SearchState({this.searchTip = ""});

  @override
  SearchState clone() {
    return SearchState()..searchTip = searchTip;
  }
}

SearchState initState(Map<String, dynamic> args) {
  return SearchState();
}

class SearchConnector extends ConnOp<HomeIndexState, SearchState> {
  @override
  SearchState get(HomeIndexState state) {
    return SearchState()..searchTip = "我是钢铁侠";
  }
}
