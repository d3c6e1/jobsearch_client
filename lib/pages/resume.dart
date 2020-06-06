import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/pages/pages.dart';
import 'package:jobsearch_client/services/services.dart';

class ResumePage extends StatefulWidget{
  static const route = '/resume';
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
            builder: (context) =>  LoginPage());
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
        Center(
          child: Text(
            '${cv?.name}',
          ),
        ),
        divider,
        Footer(),
      ],
    );
  }

}