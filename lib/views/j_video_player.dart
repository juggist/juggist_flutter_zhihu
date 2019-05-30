import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class JVideoPlayer extends StatefulWidget {
  final String videoPath;
  final int focuseIndex;
  final int index;
  JVideoPlayer({@required this.videoPath,@required this.index,@required this.focuseIndex}) : assert(videoPath.isNotEmpty);

  @override
  State<StatefulWidget> createState() {
    return JVideoPlayerState();
  }
}

class JVideoPlayerState extends State<JVideoPlayer> {
  VideoPlayerController _controller;
  String _time = "00:00";

  @override
  void initState() {
    super.initState();
    print("focusIndex:"+widget.focuseIndex.toString()+" ; index:"+widget.index.toString());
    _controller = VideoPlayerController.network(widget.videoPath)
      ..initialize().then((_) {
        if(widget.focuseIndex == widget.index){
          _controller.play();
        }
        setState(() {
          _time = _controller.value.duration.toString();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void play(){
    _controller.play();
  }
  void pause(){
    _controller.pause();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(
                child: Text("等待"),
              ),
        Text(_time),
      ],
    );
  }
}
