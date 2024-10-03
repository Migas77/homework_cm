import 'package:flutter/material.dart';

class MyCustomPageRoute<T> extends MaterialPageRoute<T> {
  final Widget parent;

  MyCustomPageRoute({
    required this.parent,
    required super.builder,
    super.settings,
  });

  @override
  Widget buildTransitions(_, Animation<double> animation, __, Widget child) {
    var anim1 = Tween<Offset>(begin: Offset.zero, end: const Offset(-1.0, 0.0)).animate(animation);
    var anim2 = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation);
    return Stack(
      children: <Widget>[
        SlideTransition(position: anim1, child: parent),
        SlideTransition(position: anim2, child: child),
      ],
    );
  }
}