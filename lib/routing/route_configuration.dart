import 'package:flutter/material.dart';
import 'package:jobsearch_client/pages/pages.dart';
import 'package:jobsearch_client/routing/routing.dart' as r;

class RouteConfiguration {
  /// List of [Path] to for route matching. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is matched with the [Path.pattern]
  /// in the list below. As soon as there is a match, the associated builder
  /// will be returned. This means that the paths higher up in the list will
  /// take priority.
  static List<r.Path> paths = [
//    Path(
//      r'^' + ArticlePage.baseRoute + r'/([\w-]+)$',
//          (context, match) => Article.getArticlePage(match),
//    ),
    r.Path(r'^' + HomePage.route, (context, match) => HomePage(),),
    r.Path(r'^' + LoginPage.route, (context, match) => LoginPage(),),
    r.Path(r'^' + SignUpPage.route, (context, match) => SignUpPage(),),
    r.Path(r'^' + ProfilePage.route, (context, match) => ProfilePage(),),
    r.Path(r'^' + AccountPage.route, (context, match) => AccountPage(),),
    r.Path(r'^' + MyResumesPage.route, (context, match) => MyResumesPage(),),
  ];

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    for (r.Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name)) {
        final firstMatch = regExpPattern.firstMatch(settings.name);
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }
    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    return null;
  }
}