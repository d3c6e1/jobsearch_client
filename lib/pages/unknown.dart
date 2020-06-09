import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/pages/pages.dart';

class UnknownPage extends StatelessWidget{
  static const String ROUTE = '/unknown';

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      children: <Widget>[
        MenuBar(),
        Column(
          children: [
            Container(
              child: Center(
                child: Text(
                  'Unknown page',
                  style: headlineThemeTextStyle,
                ),
              ),
            ),
            divider,
            Container(
              child: Center(
                child: BaseButton(
                  buttonText: 'Go home',
                  onPressed: () => Navigator.popAndPushNamed(context, HomePage.ROUTE),
                ),
              ),
            ),
          ],
        ),
        divider,
        Footer(),
      ],
    );
  }
}