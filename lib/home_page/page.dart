import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';
import 'package:zhihu_flutter/views/keep_alive_widget.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

import 'search_component/component.dart';
import 'search_component/state.dart' as search_state;

class HomeIndexPage extends Page<HomeIndexState, Map<String, dynamic>> {
  HomeIndexPage()
      : super(
          wrapper: (Widget child) {
            return KeepAliveWidget(child);
          },
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeIndexState>(
              adapter: null,
              slots: <String, Dependent<HomeIndexState>>{
                "search": search_state.SearchConnector() + SearchComponent(),
              }),
          middleware: <Middleware<HomeIndexState>>[],
        );
}
