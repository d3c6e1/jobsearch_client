import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/pages/pages.dart';
import 'package:jobsearch_client/pdf_templates/pdf_templates.dart';
import 'package:jobsearch_client/services/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:jobsearch_client/extensions/extensions.dart';

class ResumePage extends StatefulWidget{
  static const ROUTE = '/resume';
  final int id;

  const ResumePage({Key key, this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage>{
  CV cv;
  StreamSubscription subscription;
  User user;

  @override
  void initState() {
    super.initState();
    subscription = Store.instance.cvController.listen((CV cv) {
      setState(() {
        this.cv = cv;
      });
      if(cv != null){
        Store.instance.userController.getUser(cv.owner).then((User u) {
          setState(() {
            user = u;
          });
        });
      }
    }, onError: (err) {
      if (err is UnauthenticatedException) {
        showDialog(context: context, barrierDismissible: false,
            builder: (context) => LoginPage());
      }
    });
    Store.instance.cvController.getCV(widget.id);
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      children: [
        MenuBar(),
        SizedBox(
          height: 20,
        ),
        user != null ?
            Column(
              children: [
                _resumeOptions(context, cv?.owner),
                _resumeInformation(cv, user),
              ],
            ) : Center(child: CircularProgressIndicator()),
        divider,
        Footer(),
      ],
    );
  }

  _resumeInformation(CV cv, User user){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            xs: 12,
            sm: 12,
            md: 12,
            child: ResponsiveGridRow(
              children: [
                resumeBasicData(cv, user),
                userInformation(user),
                resumePhoto(user),
                ResponsiveGridCol(
                    xs: 12,
                    sm: 12,
                    md: 12,
                    child: divider
                ),
                userContactInformation(user),
              ],
            ),
          ),
          ResponsiveGridCol(
              xs: 12,
              sm: 12,
              md: 12,
              child: divider
          ),
          ResponsiveGridCol(
            xs: 12,
            sm: 12,
            md: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                jobExperience(cv),
                divider,
                education(cv),
                divider,
                languageLvl(cv),
                divider,
                additionalData(cv),
              ],
            ),
          ),
        ],
      ),
    );
  }

  jobExperience(CV cv){
    return
      Container(
        child: Column(
          children: [
            Text(
              'Experience',
              style: headlineTextStyle,
            ),

          ],
        ),
      );
  }

  education(CV cv){
    return
      Container(
        child: Column(
          children: [
            Text(
              'Education',
              style: headlineTextStyle,
            ),

          ],
        ),
      );
  }

  languageLvl(CV cv){
    return
      Container(
        child: Column(
          children: [
            Text(
              'Languages',
              style: headlineTextStyle,
            ),

          ],
        ),
      );
  }

  additionalData(CV cv){
    return
      Container(
        child: Column(
          children: [
            Text(
              'Additional information',
              style: headlineTextStyle,
            ),

          ],
        ),
      );
  }

  userInformation(User user){
    return ResponsiveGridCol(
      xs: 12,
      sm: 12,
      md: 8,
      child: Center(
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(1.0),
            1: FlexColumnWidth(4.0),
          },
          children: [
            TableRow(
              children: [
                ParagraphCell(
                  text: 'Age:',
                ),
                DataTableCell(
                  text: user.birthDate != null ?
                  '${user.birthDate.getAge}' :
                  '',
                )
              ],
            ),
            TableRow(
              children: [
                ParagraphCell(
                  text: 'City:',
                ),
                DataTableCell(
                  text: user.city != null ?
                  '${user.city}' :
                  '',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  userContactInformation(User user){
    return ResponsiveGridCol(
      xs: 12,
      sm: 12,
      md: 12,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contacts',
              style: headlineTextStyle,
            ),
            Table(
              columnWidths: {
                0: FlexColumnWidth(1.0),
                1: FlexColumnWidth(4.0),
              },
              children: [
                TableRow(
                    children: [
                      ParagraphCell(
                        text: 'Email:',
                      ),
                      DataTableCell(
                        text: user.email != null ?
                        '${user.email}' :
                        '',
                      )
                    ]
                ),
                TableRow(
                    children: [
                      ParagraphCell(
                        text: 'Phone number:',
                      ),
                      DataTableCell(
                        text: user.phoneNumber != null ?
                        '${user.phoneNumber}' :
                        '',
                      )
                    ]
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  resumePhoto(User user){
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
          ],
        ),
      ),
    );
  }

  resumeBasicData(CV cv, User user){
    return ResponsiveGridCol(
      xs: 12,
      sm: 12,
      md: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Resume updated: ${cv.publishDate.toLocal().date}',
              style: subtitleThemeTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              '${user.firstName} ${user.lastName}',
              style: headlineTextStyle,
            ),
          ),Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              '${cv.name}',
              style: headlineSecondaryTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  _resumeOptions(BuildContext context, int owner){
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          _downloadButton(),
          context.select((User u) => u?.id) != owner ?
          SizedBox.shrink() :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _editButton(),
              divider,
            ],
          ),
        ],
      ),
    );
  }

  _editButton(){
    return BaseButton(
      buttonText: 'Edit',
      onPressed: () => null,
    );
  }

  _downloadButton(){
    return BaseButton(
      buttonText: 'Download',
      onPressed: () => ResumePDF(cv).downloadWEB(),
    );
  }
}
