import 'package:flutter/material.dart';

extension Push on BuildContext {
  push(Widget widget) {
    return Navigator.of(this).push(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ));
  }
}

extension PushAndRemoveUntil on BuildContext {
  pushAndRemoveUntil(Widget widget) {
    return Navigator.of(this).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ), (route) => false);
  }
}

extension PushAndRemoveUntilToRight on BuildContext {
  pushAndRemoveUntilToRight(Widget widget) {
    return Navigator.pushAndRemoveUntil(
        this,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => widget,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            final tween = Tween(begin: begin, end: end);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
        ),
        (route) => false);
  }
}
