import 'package:flutter/material.dart';
import 'package:jobsearch_client/locator.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/pages/pages.dart';
import 'package:jobsearch_client/routing/routing.dart';
import 'package:jobsearch_client/services/services.dart';
import 'package:jobsearch_client/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  setupLocator();
  runApp(AppClient());
}

class AppClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>(create: (_) => Store.instance.userController,)
      ],
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          background: Container(color: Color(0xFFF5F5F5)),
        ),
        initialRoute: HomePage.route,
        onGenerateRoute: generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
        theme: ThemeConfig.lightTheme,
      ),
    );
  }
}
