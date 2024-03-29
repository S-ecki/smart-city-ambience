import 'package:flutter/material.dart';

/**
 * 
 * 
 */
class PopupMenuWidget<T> extends PopupMenuEntry<T> {
  const PopupMenuWidget({Key key, this.height, this.child}) : super(key: key);

  @override
  final Widget child;

  @override
  final double height;

  @override
  bool get enabled => false;

  @override
  _PopupMenuWidgetState createState() => new _PopupMenuWidgetState();

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _PopupMenuWidgetState extends State<PopupMenuWidget> {
  @override
  Widget build(BuildContext context) => widget.child;
}
