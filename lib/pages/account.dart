import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/utils/theme_config.dart';
import 'package:jobsearch_client/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AccountPage extends StatefulWidget{
  static const String ROUTE = '/my/account';

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      children: [
        MenuBar(),
        SizedBox(
          height: 20,
        ),
        _AccountHeader(),
        divider,
        _Account(),
        divider,
        Footer(),
      ],
    );
  }
}

class _Account extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AccountState();
}

class _AccountState extends State<_Account> {
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
            child: Table(
              children: [
                TableRow(
                  children: [
                    ParagraphCell(
                      text: 'Full name',
                    ),
                    DataTableCell(
                      text: '${context.select((User u) => u?.firstName)??''} '
                          '${context.select((User u) => u?.lastName)??''}',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    ParagraphCell(
                      text: 'Birth date',
                    ),
                    DataTableCell(
                      text: context.select((User u) => Formatting.formatDate(u?.birthDate))??'',
                    )
                  ],
                ),
                TableRow(
                  children: [
                    ParagraphCell(
                      text: 'City',
                    ),
                    DataTableCell(
                      text: context.select((User u) => u?.city)??'',
                    )
                  ],
                ),
                TableRow(
                  children: [
                    ParagraphCell(
                      text: 'Phone',
                    ),
                    DataTableCell(
                      text: context.select((User u) => u?.phoneNumber)??'',
                    )
                  ],
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

class DataTableCell extends StatelessWidget {
  const DataTableCell({
    Key key, @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          text,
          style: bodyTextStyle,
        ),
      ),
    );
  }
}

class ParagraphCell extends StatelessWidget {
  const ParagraphCell({
    Key key, @required this.text
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.0),
        child: Text(
          text,
          style: subtitleTextStyle,
        ),
      ),
    );
  }
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
              '${context.select((User u) => u?.email)??''}',
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
    return BasePageHeader(
      title: 'Personal data',
      subtitle: 'Your email, name, phone number etc',
    );
  }
}