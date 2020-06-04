import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/pages/pages.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePage.route:
      return _getPageRoute(HomePage(), settings);
    case LoginPage.route:
      return _getPageRoute(LoginPage(), settings);
    case SignUpPage.route:
      return _getPageRoute(SignUpPage(), settings);
    case ProfilePage.route:
      return _getPageRoute(ProfilePage(), settings);
    case AccountPage.route:
      return _getPageRoute(AccountPage(), settings);
    case MyResumesPage.route:
      return _getPageRoute(MyResumesPage(), settings);
    default:
      return _getPageRoute(HomePage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
    settings: RouteSettings(name: routeName),
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    child,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}