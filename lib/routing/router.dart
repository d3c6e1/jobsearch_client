import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/pages/pages.dart';
import 'package:jobsearch_client/extensions/extensions.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name.getRoutingData; // Get the routing Data
  switch (routingData.route) {
    case HomePage.ROUTE:
      return _getPageRoute(HomePage(), settings);
      break;
    case LoginPage.ROUTE:
      return _getPageRoute(LoginPage(), settings);
      break;
    case SignUpPage.ROUTE:
      return _getPageRoute(SignUpPage(), settings);
      break;
    case ProfilePage.ROUTE:
      return _getPageRoute(ProfilePage(), settings);
      break;
    case AccountPage.ROUTE:
      return _getPageRoute(AccountPage(), settings);
      break;
    case MyResumesPage.ROUTE:
      return _getPageRoute(MyResumesPage(), settings);
      break;
    case ResumePage.ROUTE:
      var id = int.tryParse(routingData['id']); // Get the id from the data.
      return _getPageRoute(ResumePage(id: id), settings);
      break;
    default:
      return _getPageRoute(UnknownPage(), settings);
      break;
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