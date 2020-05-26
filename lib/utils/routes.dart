import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const String home = "/";
  static const String profile = '/profile';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String createCV = '/create_resume';
  static const String vacancies = '/vacancies';
  static const String docs = '/docs';
  static const String organizations = '/organizations';
  static const String cv = '/cv';
  static const String vacancy = '/vacancy';
  static const String doc = '/doc';
  static const String organization = '/organization';

  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 200}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      },
    );
  }
}