import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/utils/utils.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widgets: [
        MenuBar(),
        SizedBox(
          height: 20,
        ),
        _ProfileHeader(),
        divider,
        Profile(),
        divider,
        Footer(),
      ],
    );
  }
}

class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ResponsiveGridRow(
        children: [
          _profileItem(
            context,
            img: 'img',
            itemName: 'My resumes',
            onTap: () => Navigator.pushNamed(context, Routes.my_resumes),
          ),
          _profileItem(
            context,
            img: 'img',
            itemName: 'Personal data',
            onTap: () => Navigator.pushNamed(context, Routes.account),
          ),
          _profileItem(
            context,
            img: 'img',
            itemName: 'Log out',
            onTap: () {
              Store.instance.userController.logout();
              Navigator.pushNamed(context, Routes.home);
            },
          ),
        ],
      ),
    );
  }

  ResponsiveGridCol _profileItem(BuildContext context,
      {String img, String itemName, Function onTap}) {
    return ResponsiveGridCol(
          xs: 12,
          sm: 6,
          md: 4,
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: textSecondary,
                width: 1.0,
              )
            ),
            child: MouseCursor(
              child: GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        img,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        itemName,
                        style: headlineSecondaryThemeTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String fName = context.select((User user) => user?.firstName) ?? '';
    return BasePageHeader(
      title: 'Welcome, $fName!',
      subtitle: 'Profile section with some options',
    );
  }
}