import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/utils/theme_config.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AccountPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widgets: [
        MenuBar(),
        SizedBox(
          height: 20,
        ),
        _AccountHeader(),
        divider,
        Account(),
        divider,
        Footer(),
      ],
    );
  }
}

class Account extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            xs: 12,
            sm: 12,
            md: 12,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ThemeConfig.lightTheme.accentColor,
                  width: 1.0,
                ),
              ),
              child: ResponsiveGridRow(
                children: [
                  email(context),
                  pass(),
                ],
              ),
            ),
          ),
          ResponsiveGridCol(
            xs: 12,
            sm: 12,
            md: 12,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ThemeConfig.lightTheme.accentColor,
                  width: 1.0,
                ),
              ),
              child: ResponsiveGridRow(
                children: [
                  personalData(context),
                  photo(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget personalData(BuildContext context){
  return ResponsiveGridCol(
    xs: 12,
    sm: 12,
    md: 8,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Personal data',
              style: headlineSecondaryTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Row(
              children: [
                Container(
                  child: Text(
                    'fgdsrefs'
                  ),
                ),
                Container(
                  child: Text(
                      '654873o39237'
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            alignment: Alignment.bottomLeft,
            child: BaseButton(
              onPressed: () => null,
              buttonText: 'Change',
            ),
          ),
        ],
      ),
    ),
  );
}

Widget photo(BuildContext context){
  return ResponsiveGridCol(
    xs: 12,
    sm: 12,
    md: 4,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Photo',
              style: headlineSecondaryTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              child: Image.asset(
                'assets/images/no_photo_user.png',
                height: 100,
                width: 100,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            alignment: Alignment.bottomLeft,
            child: BaseButton(
              onPressed: () => null,
              buttonText: 'Change',
            ),
          ),
        ],
      ),
    ),
  );
}

Widget email(BuildContext context){
  return ResponsiveGridCol(
    xs: 12,
    sm: 12,
    md: 8,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Email',
              style: headlineSecondaryTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Text(
              // TODO change to valid
              'rkjsdfhsdlkhfsdl',
//              '${context.select((User u) => u.email)}',
              style: subtitleTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            alignment: Alignment.bottomLeft,
            child: BaseButton(
              onPressed: () => null,
              buttonText: 'Change',
            ),
          ),
        ],
      ),
    ),
  );
}

Widget pass(){
  return ResponsiveGridCol(
    xs: 12,
    sm: 12,
    md: 4,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Text(
              'Password',
              style: headlineSecondaryTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            alignment: Alignment.bottomLeft,
            child: BaseButton(
              onPressed: () => null,
              buttonText: 'Change',
            )
          ),
        ],
      ),
    ),
  );
}

class _AccountHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal data',
            style: headlineThemeTextStyle,
          ),
          Text(
            'Your email, name, phone number etc',
            style: subtitleTextStyle,
          ),
        ],
      ),
    );
  }
}