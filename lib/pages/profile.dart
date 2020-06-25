import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/pages/my_documents.dart';
import 'package:jobsearch_client/pages/pages.dart';
import 'package:jobsearch_client/services/services.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget{
  static const String ROUTE = '/my';

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      children: [
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
            img: Image.asset(
              'assets/images/my_resumes.png',
              height: 70,
              width: 70,
            ),
            itemName: 'My resumes',
            onTap: () => Navigator.pushNamed(context, MyResumesPage.ROUTE),
          ),
          _profileItem(
            context,
            img: Image.asset(
              'assets/images/no_photo_user.png',
              height: 70,
              width: 70,
            ),
            itemName: 'Personal data',
            onTap: () => Navigator.pushNamed(context, AccountPage.ROUTE),
          ),
          _profileItem(
            context,
            img: Image.asset(
              'assets/images/my_documents.png',
              height: 70,
              width: 70,
            ),
            itemName: 'Documents',
            onTap: () => Navigator.pushNamed(context, MyDocumentsPage.ROUTE),
          ),
          _profileItem(
            context,
            img: Image.asset(
              'assets/images/organization.png',
              height: 70,
              width: 70,
            ),
            itemName: 'Organization',
            onTap: () => Navigator.pushNamed(context, OrganizationPage.ROUTE),
          ),
          _profileItem(
            context,
            img: Image.asset(
              'assets/images/logout.png',
              height: 70,
              width: 70,
            ),
            itemName: 'Log out',
            onTap: () {
              Store.instance.userController.logout();
              Navigator.pushNamed(context, HomePage.ROUTE);
            },
          ),
        ],
      ),
    );
  }

  ResponsiveGridCol _profileItem(BuildContext context,
      {Image img, String itemName, Function onTap}) {
    return ResponsiveGridCol(
          xs: 12,
          sm: 12,
          md: 6,
          lg: 4,
          xl: 3,
          child: Container(
            margin: EdgeInsets.all(3.0),
            padding: EdgeInsets.all(5.0),
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
                      child: img,
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