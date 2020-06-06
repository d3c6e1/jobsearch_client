import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/pages/pages.dart';
import 'package:jobsearch_client/services/services.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();
    subscription = Store.instance.cvController.listen((cv) {
      setState(() {
        this.cv = cv;
      });
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
        _ResumeOptions(
          resumeOwnerID: cv?.owner,
        ),
        _ResumeInformation(
          cv: cv,
        ),
        divider,
        Footer(),
      ],
    );
  }
}

class _ResumeInformation extends StatelessWidget{
  final CV cv;

  const _ResumeInformation({Key key,@required this.cv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(

      ),
    );
  }
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