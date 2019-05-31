import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/state.dart';

import 'reducer.dart';
import 'package:zhihu_flutter/home_page/recommend_module/state.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/component_01.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/component_02.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/component_03.dart';

class RecommendListAdapterAdapter extends DynamicFlowAdapter<RecommendState> {
  RecommendListAdapterAdapter()
      : super(
          pool: <String, Component<Object>>{
            "0": ItemComponent01(),
            "1": ItemComponent02(),
            "2": ItemComponent03(),
          },
          connector: _RecommendListAdapterConnector(),
          reducer: buildReducer(),
        );
}

class _RecommendListAdapterConnector
    extends ConnOp<RecommendState, List<ItemBean>> {
  @override
  List<ItemBean> get(RecommendState state) {
    List<ItemBean> items = List<ItemBean>();
    state.itemStates.forEach((data) {
      if (data.videoPath.isNotEmpty) {
        items.add(ItemBean("0", data));
      } else if (data.picPath.isNotEmpty) {
        items.add(ItemBean("1", data));
      } else {
        items.add(ItemBean("2", data));
      }
    });
    return items;
  }

  @override
  void set(RecommendState state, List<ItemBean> items) {
    if (items?.isNotEmpty == true) {
      state.itemStates = List.from(items.map((itemBean) => itemBean.data));
    } else {
      state.itemStates = List<ItemState>();
    }
  }

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}
