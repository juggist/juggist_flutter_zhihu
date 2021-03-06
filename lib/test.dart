import 'package:flutter/material.dart';
import 'package:flutter_simple_video_player/flutter_simple_video_player.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8
class My3App extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyState();
  }
}

class MyState extends State<My3App>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "http://via.placeholder.com/288x188",
          fit: BoxFit.fill,
        );
      },
      loop: false,
      itemCount: 3,
      itemWidth: 300.0,
      itemHeight: 400.0,
      layout: SwiperLayout.TINDER,
    );
      Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: Container(
          height: 300.0,
          child: Text("nihao"),
        ));
  }

  @override
  void initState() {
    super.initState();
    print("init01:" + DateTime.now().toString());
    call2();
    print("init02:" + DateTime.now().toString());
  }

  void call1() async {
    await Future.delayed(Duration(seconds: 2), () {
      print("call1:" + DateTime.now().toString());
    });
  }

  void call2() async {
    await call1();
    await Future.delayed(Duration(seconds: 3), () {print("call2:" + DateTime.now().toString());});
    print("finish:" + DateTime.now().toString());
  }

}