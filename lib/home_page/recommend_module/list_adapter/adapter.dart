import 'package:fish_redux/fish_redux.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/component.dart';
import 'package:zhihu_flutter/home_page/recommend_module/component/state.dart';
import 'package:zhihu_flutter/home_page/recommend_module/item_component/component_01.dart';
import 'package:zhihu_flutter/home_page/recommend_module/item_component/component_02.dart';
import 'package:zhihu_flutter/home_page/recommend_module/item_component/component_03.dart';
import 'package:zhihu_flutter/home_page/recommend_module/item_component/state.dart';

import 'reducer.dart';
import 'package:zhihu_flutter/home_page/recommend_module/state.dart';

class RecommendListAdapterAdapter extends DynamicFlowAdapter<RecommendState> {
  RecommendListAdapterAdapter()
      : super(
          pool: <String, Component<Object>>{
            "0": ItemComponent(ItemComponentConecctor() + ItemComponent_01()),
            "1": ItemComponent(ItemComponentConecctor() + ItemComponent_02()),
            "2": ItemComponent(ItemComponentConecctor() + ItemComponent_03()),
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
    for (var i = 0; i < state.itemStates.length; i++) {
      ItemState data = state.itemStates[i];
      if (i == 0) {
        data.firstItemIndex = true;
      }
      if (data.videoPath?.isNotEmpty == true) {
        items.add(ItemBean("0", data));
      } else if (data.picPath?.isNotEmpty == true) {
        items.add(ItemBean("1", data));
      } else {
        items.add(ItemBean("2", data));
      }
    }
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
