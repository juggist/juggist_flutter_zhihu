import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

import '../global_config.dart';
import 'action.dart';
import 'state.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

Widget buildView(MineState state, Dispatch dispatch, ViewService viewService) {
  List<String> categoryPics = List.from([
    "profile_ic_more_learn.webp",
    "profile_ic_more_shop.webp",
    "profile_ic_more_wallet.webp",
    "profile_ic_more_read.webp",
    "profile_ic_more_book.webp",
    "profile_ic_more_download.webp",
    "profile_ic_more_advisory.webp",
    "profile_ic_more_activity.webp"
  ]);
  List<String> categoryNames = List.from([
    "学习记录",
    "已购",
    "余额礼券",
    "读书会",
    "我的书架",
    "下载中心",
    "付费咨询",
    "活动广场",
  ]);
  List<String> settingPics = List.from([
    "profile_ic_more_construction.webp",
    "profile_ic_more_help.webp",
    "profile_ic_more_night.webp",
  ]);
  List<String> settingNames = List.from([
    "社区建设",
    "反馈与帮助",
    "夜间模式",
  ]);
  Widget _line() {
    return SliverToBoxAdapter(
      child: Container(
        height: 8,
        color: GlobalColors.bgGrayColor,
      ),
    );
  }

  //搜索栏
  Widget _searchBar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 40,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 5),
            child: FlatButton.icon(
              onPressed: null,
              icon: Icon(
                Icons.search,
                size: 24,
                color: GlobalColors.searchIconColor,
              ),
              label: Container(
                margin: EdgeInsets.only(left: 0),
                child: Text(
                  "搜索知乎内容",
                  style: TextStyle(
                      fontSize: 14,
                      color: GlobalColors.searchIconColor,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: GlobalColors.searchBgColor,
                borderRadius: BorderRadius.all(Radius.circular(6))),
          ),
        ),
        FlatButton(
            padding: EdgeInsets.only(left: 20, right: 8),
            onPressed: null,
            child: Image.asset(
              Constant.ASSETS_IMG + "profile_ic_more_scan.webp",
              width: 24,
              height: 24,
              color: Colors.white,
            )),
        FlatButton(
            onPressed: null,
            child: Image.asset(
              Constant.ASSETS_IMG + "profile_ic_more_setting.webp",
              width: 24,
              height: 24,
              color: Colors.white,
            )),
      ],
    );
  }

//用户信息
  Widget _accountInfo() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(8,4,8,8),
        margin: EdgeInsets.only(top: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: <Widget>[
            //第一排
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://pic2.zhimg.com/93f8c1a43c32c42f603a2e5a7c289817_xl.jpg"),
                  radius: 30,
                ),
                Container(
                  height: 78,
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("公子张",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold)),
                      Container(
                        height: 20,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              child: Image.asset(
                                Constant.ASSETS_IMG +
                                    "profile_more_more_ic_more_creditscore_entrancelogo.webp",
                                width: 12,
                                height: 12,
                              ),
                              padding: EdgeInsets.only(left: 6, right: 4),
                            ),
                            Text("知乎盐值: 422",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: GlobalColors.labelFontColor)),
                            Padding(
                              child: Image.asset(
                                  Constant.ASSETS_IMG +
                                      "profile_more_more_ic_zhapp_enterprofile.webp",
                                  width: 10,
                                  height: 10,
                                  color: GlobalColors.labelFontColor),
                              padding: EdgeInsets.only(right: 2),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: GlobalColors.labelbgColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "个人主页 ",
                        style: TextStyle(
                            fontSize: 14,
                            color: GlobalColors.fontUnselectColor),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 10, color: GlobalColors.fontUnselectColor),
                    ],
                  ),
                ),
              ],
            ),
            //第二排
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(7, (index) {
                  if (index % 2 == 0) {
                    return Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("25",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("我的创作",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w100
                            )),
                      ],
                    ));
                  } else {
                    return Container(
                      margin: EdgeInsets.only(top: 4),
                      width: 0.5,
                      height: 20,
                      color: GlobalColors.fontUnselectColor,
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //类目导航条
  Widget _labelNav(
      String imgName, String leadTitle, String endTitle, Function() click) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 6, right: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton.icon(
              onPressed: null,
              icon: Image.asset(
                Constant.ASSETS_IMG + imgName,
                width: 18,
                height: 18,
              ),
              label: Text(leadTitle,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: GlobalColors.fontBlackColor))),
          endTitle == null || endTitle.isEmpty
              ? Container()
              : GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        endTitle + " ",
                        style: TextStyle(
                            fontSize: 12,
                            color: GlobalColors.fontUnselectColor),
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 10, color: GlobalColors.fontUnselectColor),
                    ],
                  ),
                  onTap: () {
                    if (click != null) click();
                  },
                )
        ],
      ),
    );
  }

  //创作者中心
  Widget _artistLable(String title, String count, String info) {
    return Column(
      children: <Widget>[
        Text(title,
            style: TextStyle(
                color: GlobalColors.fontDarkGrayColor,
                fontSize: 14,
                fontWeight: FontWeight.w400)),
        Text(count,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        Text(info,
            style: TextStyle(
                color: GlobalColors.fontDarkGrayColor,
                fontSize: 14,
                fontWeight: FontWeight.w400)),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Widget _artistCenter() {
    return Container(
      child: Column(
        children: <Widget>[
          _labelNav("ic_feedback_pen.webp", "创作者中心", "查看详情", () {
            print("创作者中心");
          }),
          Container(
            height: 100,
            padding: EdgeInsets.only(top: 6, bottom: 30),
            child: Row(
              children: [
                Expanded(child: _artistLable("昨日回答阅答数", "5", "较前日  --")),
                Container(
                  width: 0.5,
                  color: GlobalColors.bgColor,
                ),
                Expanded(child: _artistLable("昨日回答赞同数", "23", "较昨天 --"))
              ],
            ),
          ),
        ],
      ),
      color: Colors.white,
    );
  }

  //有icon的按钮
  Widget _todoIconButton(
      String title, String picName, Color bgColor, Color textColor) {
    return FlatButton.icon(
      onPressed: () {},
      icon: Image.asset(
        Constant.ASSETS_IMG + picName,
        width: 13,
        height: 13,
        color: textColor,
      ),
      label: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          color: textColor,
          fontWeight: FontWeight.bold
        ),
      ),
      color: bgColor,
      padding: EdgeInsets.fromLTRB(13, 5, 13, 5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
    );
  }

  //无icon的按钮
  Widget _todoButton(String title, Function() click) {
    return FlatButton(
      onPressed: () {
        if (click != null) click();
      },
      color: GlobalColors.labelTodoBgColor,
      padding: EdgeInsets.fromLTRB(13, 5, 13, 5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          color: GlobalColors.labelFontColor,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
  //label底部控件
  Widget _labelBottom(String leadTitle,String buttonTitle,Function() click){
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          leadTitle,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        _todoButton(buttonTitle, click),
      ],
    );
  }

  //label控件
  Widget _labelContent(String imgPath,String title,String bottomLeadTitle,String buttonTitle,Function() click,{String content}){
    return Container(
      margin: EdgeInsets.only(top: 4),
      height: 98,
      child: PageView(
          children: List.generate(10, (index) {
            return Container(
              padding: EdgeInsets.only(right: 30),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(6)),
                        child: Image.network(
                          imgPath,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: content == null || content.isEmpty ? Text(
                            title,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ):Column(children: <Widget>[
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              content,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],),
                          padding: EdgeInsets.only(left: 10),
                        ),
                      ),
                    ],
                  ),
                  _labelBottom(bottomLeadTitle,buttonTitle,click),
                ],
              ),
            );
          }),
          controller: PageController(viewportFraction: 0.88),
          pageSnapping: true),
    );
  }
  return Scaffold(
    body: Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            //搜索，用户
            SliverToBoxAdapter(
              child: Stack(
                children: <Widget>[
                  //背景
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: GlobalColors.bgGrayColor,
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage(
                            Constant.ASSETS_IMG + 'profile_more_head.webp'),
                      ),
                    ),
                  ),
                  Container(
                    height: 256,
                    padding: EdgeInsets.only(
                        top: JWindow.statusBarTop + 9,
                        left: 15,
                        right: 15,
                        bottom: 10),
                    child: Column(
                      children: <Widget>[
                        //搜索栏
                        _searchBar(),
                        //用户信息
                        _accountInfo(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //会员
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: 15),
                color: Colors.white,
                height: 48,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      Constant.ASSETS_IMG + "ic_zhivip.webp",
                      width: 28,
                      height: 28,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "开通盐选会员",
                        style: TextStyle(
                            color: GlobalColors.fontGoldColor, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _line(),
            //分类
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          Constant.ASSETS_IMG + categoryPics[index],
                          width: 24,
                          height: 24,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text(
                            categoryNames[index],
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    color: Colors.white,
                  );
                }, childCount: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, childAspectRatio: 27 / 23)),
            _line(),
            //设置
            SliverToBoxAdapter(
              child: Row(
                children: List.generate(
                  4,
                  (index) {
                    return Expanded(
                      child: Container(
                        height: 84,
                        color: Colors.white,
                        child: index == 3
                            ? null
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    Constant.ASSETS_IMG + settingPics[index],
                                    width: 24,
                                    height: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 4),
                                    child: Text(
                                      settingNames[index],
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    );
                  },
                ),
              ),
            ),
            //我的卡片
            SliverToBoxAdapter(
              child: Container(
                color: GlobalColors.bgGrayColor,
                height: 42,
                padding: EdgeInsets.only(left: 15, right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("我的卡片",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    FlatButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.add,
                          color: GlobalColors.labelFontColor,
                          size: 14,
                        ),
                        label: Text("管理卡片",
                            style: TextStyle(
                                fontSize: 14,
                                color: GlobalColors.labelFontColor))),
                  ],
                ),
              ),
            ),
            //创作者中心
            SliverToBoxAdapter(
              child: _artistCenter(),
            ),
            _line(),
            //回答问题
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _labelNav("w_ic_write.webp", "回答问题", "更多问题", () {
                      print("回答问题");
                    }),
                    Card(
                      margin: EdgeInsets.fromLTRB(15, 0, 15, 18),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(13, 18, 13, 25),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "如何评价剧场版动画《甲城的卡巴内瑞:海门决战》?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 28),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "40 人 关注",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  _todoIconButton(
                                      "忽略",
                                      "w_ic_write.webp",
                                      GlobalColors.labelUnTodoBgColor,
                                      GlobalColors.labelUnTodoColor),
                                  Padding(
                                    padding: EdgeInsets.only(left: 22),
                                    child: _todoIconButton(
                                        "回答",
                                        "w_ic_write.webp",
                                        GlobalColors.labelTodoBgColor,
                                        GlobalColors.labelFontColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                color: Colors.white,
              ),
            ),
            _line(),
            //视频回答
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(bottom: 18),
                child: Column(
                  children: <Widget>[
                    _labelNav(
                      "ic_live_videocelllike_ing.webp",
                      "视频回答",
                      null,
                      null,
                    ),
                    _labelContent("https://pic2.zhimg.com/93f8c1a43c32c42f603a2e5a7c289817_xl.jpg","你们平时都是怎么坑宠物的？它会生气吗？","395个视频回答 . 8.1K 人关注","拍回答",null),
                  ],
                ),
                color: Colors.white,
              ),
            ),
            _line(),
            //想法
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(bottom: 18),
                child: Column(
                  children: <Widget>[
                    _labelNav(
                      "ic_reader_share_idea_icon.webp",
                      "想法",
                      null,
                      null,
                    ),
                    _labelContent("https://pic1.zhimg.com/50/v2-af775286d17063d8713437941d1d9a0d_hd.jpg","理想的工作状态","395个视频回答 . 8.1K 人关注","写想法",null,content: "什么样的工作最符合你的心意"),
                  ],
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
//        Opacity(
//          opacity: 0.5,
//          child: Container(
//            color: Colors.white,
//            height: 100,
//          ),
//        )
      ],
    ),
  );
}
//ZHVideoPlayerInitialize
//initZm1
//System.out
//Record json log
//"https://www.zhihu.com/appview/v2/zhmore?appview=1&video_maker_supported=1&config=%7B%22content_padding_top%22%3A0%2C%22content_padding_bottom%22%3A0%2C%22content_padding_left%22%3A0%2C%22content_padding_right%22%3A0%2C%22title_font_size%22%3A22%2C%22body_font_size%22%3A16%2C%22can_auto_load_image%22%3Atrue%2C%22app_info%22%3A%22OS%3DAndroid%26Release%3D9%26Model%3DEML-AL00%26VersionName%3D6.0.0%26VersionCode%3D1298%26Product%3Dcom.zhihu.android%26Width%3D1080%26Height%3D2159%26Installer%3D%25E5%258D%258E%25E4%25B8%25BA%25E5%25BA%2594%25E7%2594%25A8%25E5%2595%2586%25E5%25BA%2597%26DeviceType%3DAndroidPhone%26Brand%3DHUAWEI%26OperatorType%3D46002%22%2C%22is_dark_theme%22%3Afalse%2C%22X-SUGER%22%3A%22VURJRD1BRERoc2J0dWx3NUxCV3dRYWJINWtvYzRCYm5tRjI2LWlpUT07SU1FST04NjY1OTYwNDM4MTMwMjE7QU5EUk9JRF9JRD03Y2E1YmM4YTUwN2Q4ZTFlO01BQz0zNDoyRTpCNjo4Mzo1RTpCOTtDT09SRF9MQVQ9MzEuMTc4Njg2MTQxOTY3NzczO0NPT1JEX0xORz0xMjEuMzk1NDIzODg5MTYwMTY7Q09PUkRfVElNRVNUQU1QPTE1NjAzOTYxOTY7TEJTPXsiY2l0eUNvZGUiOiIwMjEiLCJsYXRpdHVkZSI6MzEuMTc2OTg5LCJsb25naXR1ZGUiOjEyMS4zOTk5OSwibG9jYXRpb25UeXBlIjoibG9jYXRpb25fdHlwZV9jYWNoZSIsInBvaU5hbWUiOiLmvJXmsrPms77mmbrmsYflm63ljZfljLoiLCJzdHJlZXQiOiLpkqblt57ljJfot68ifTtMQlNfTEVOR1RIPTEzNTtMQlNfVFM9MTU2MDM5NjM1MjYwNw%3D%3D%22%2C%22cardlist_v2%22%3A%5B%7B%22name%22%3A%22creator%22%2C%22showDot%22%3Afalse%7D%2C%7B%22name%22%3A%22question%22%2C%22showDot%22%3Afalse%7D%2C%7B%22name%22%3A%22video%22%2C%22showDot%22%3Afalse%7D%2C%7B%22name%22%3A%22pin%22%2C%22showDot%22%3Afalse%7D%5D%7D"