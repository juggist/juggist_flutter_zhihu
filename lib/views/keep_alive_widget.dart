import 'package:flutter/material.dart';
class KeepAliveWidget extends StatefulWidget{
  final Widget child;
  const KeepAliveWidget(this.child);

  @override
  State<StatefulWidget> createState() {
    return _KeepAliveWidgetState();
  }

}
class _KeepAliveWidgetState extends State<KeepAliveWidget> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }


  @override
  bool get wantKeepAlive => true;

}