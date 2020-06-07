import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/pages/pages.dart';
import 'package:jobsearch_client/services/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

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
      widgets: [
        MenuBar(),
        SizedBox(
          height: 20,
        ),
        _ResumePageHeader(),
        user != null ?
            Column(
              children: [
                _ResumeOptions(
                  resumeOwnerID: cv?.owner,
                ),
                _ResumeInformation(
                  cv: cv,
                  user: user,
                ),
              ],
            ) : Center(child: CircularProgressIndicator()),
        divider,
        Footer(),
      ],
    );
  }
}

class _ResumeInformation extends StatelessWidget{
  final CV cv;
  final User user;

  const _ResumeInformation({Key key, @required this.cv, @required this.user}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
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
                userInformation(user),
                resumePhoto(user),
              ],
            ),
          ),
          ResponsiveGridCol(child: divider),
          ResponsiveGridCol(
            xs: 12,
            sm: 12,
            md: 12,
            child: Column(
              children: [

              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget userInformation(User user){
  return ResponsiveGridCol(
    xs: 12,
    sm: 12,
    md: 8,
    child: Container(
      child: Text(
        '${user.asMap().toString()}'
      ),
    ),
  );
}

Widget resumePhoto(User user){
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

class _ResumePageHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 20,
      ),
    );
  }
}

class _ResumeOptions extends StatelessWidget{
  final int resumeOwnerID;

  const _ResumeOptions({Key key,@required this.resumeOwnerID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          context.select((User u) => u?.id) != resumeOwnerID ?
              SizedBox.shrink() :
              _EditButton(),
          divider,
        ],
      ),
    );
  }
}

class _EditButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BaseButton(
      buttonText: 'Edit',
      onPressed: () => null,
    );
  }
}