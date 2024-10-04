import 'package:flutter/material.dart';

Route createRouteSlideOut(Widget previousPage) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => previousPage,
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      final Tween<Offset> offsetTween = Tween<Offset>(begin: const Offset(0.0, 0.0), end: const Offset(-1.0, 0.0));
      final Animation<Offset> slideOutLeftAnimation = offsetTween.animate(secondaryAnimation);
      return SlideTransition(position: slideOutLeftAnimation, child: child);
    },
  );
}

Route createRouteSlideIn(Widget nextPage) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nextPage,
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      final Tween<Offset> offsetTween = Tween<Offset>(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0));
      final Animation<Offset> slideOutLeftAnimation = offsetTween.animate(animation);
      return SlideTransition(position: slideOutLeftAnimation, child: child);
    },
  );
}