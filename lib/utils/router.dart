import 'package:flutter/material.dart';
import 'package:jobsearch_client/pages/pages.dart';
import 'package:jobsearch_client/utils/utils.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return Routes.fadeThrough(settings, (context) {
      switch (settings.name) {
        case Routes.home:
          return HomePage();
          break;
        case Routes.signup:
          return SignUpPage();
          break;
        case Routes.login:
          return LoginPage();
          break;
        case Routes.profile:
          return ProfilePage();
          break;
        default:
          return null;
          break;
      }
    });
  }
}