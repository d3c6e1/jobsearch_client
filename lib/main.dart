import 'package:flutter/material.dart';
import 'package:jobsearch_client/routes.dart';
import 'package:jobsearch_client/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'model/model.dart';

void main() {


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
        initialRoute: Routes.home,
        onGenerateRoute: Router.generateRoute,
        theme: ThemeConfig.lightTheme,
//      theme: Theme.of(context).copyWith(platform: TargetPlatform.android),
      ),
    );
  }
}
