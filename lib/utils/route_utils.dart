import 'package:flutter/material.dart';

class RouteUtils {
  createRouteUpDown(dynamic screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  createRouteFade(dynamic screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // var begin = const Offset(0.0, 1.0);
        // var end = Offset.zero;
        // var curve = Curves.ease;

        // var tween =
        //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return FadeTransition(
          opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
          // position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class ScreenNavigator {
  final BuildContext cx;
  ScreenNavigator({
    required this.cx,
  });
  navigate(Widget page, Tween<Offset> tween) {
    Navigator.push(
      cx,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return page;
        },
        transitionDuration: Durations.long1,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // create CurveTween
          const Curve curve = Curves.ease;
          final CurveTween curveTween = CurveTween(curve: curve);
          // chain Tween with CurveTween
          final Animatable<Offset> chainedTween = tween.chain(curveTween);
          final Animation<Offset> offsetAnimation =
              animation.drive(chainedTween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}

class NavigatorTweens {
  static Tween<Offset> bottomToTop() {
    const Offset begin = Offset(0.0, 1.0);
    const Offset end = Offset(0.0, 0.0);
    return Tween(begin: begin, end: end);
  }

  static Tween<Offset> topToBottom() {
    const Offset begin = Offset(0.0, -1.0);
    const Offset end = Offset(0.0, 0.0);
    return Tween(begin: begin, end: end);
  }

  static Tween<Offset> leftToRight() {
    const Offset begin = Offset(-1.0, 0.0);
    const Offset end = Offset(0.0, 0.0);
    return Tween(begin: begin, end: end);
  }

  static Tween<Offset> rightToLeft() {
    const Offset begin = Offset(1.0, 0.0);
    const Offset end = Offset(0.0, 0.0);
    return Tween(begin: begin, end: end);
  }
}
