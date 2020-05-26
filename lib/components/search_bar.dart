import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:responsive_grid/responsive_grid.dart';

class SearchBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>{
  String request, city;

  FocusNode requestFN = FocusNode();
  FocusNode cityFN = FocusNode();

  bool validate = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  submitForm() async{
    FormState form = formKey.currentState;
    form.save();
    if (!form.validate()) {
      setState(() {
        validate = true;
      });
    } else {
      // TODO
//      Store.instance.userController.login(email, password)
//        .catchError((e){
//
//      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    requestFN.dispose();
    cityFN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        autovalidate: validate,
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 12,
              sm: 12,
              md: 12,
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Text(
                  'Try to find vacancies right now',
                  style: headlineTextStyle,
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 12,
              sm: 12,
              md: 6,
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: InputBox(
                  hintText: 'Request',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  focusNode: requestFN,
                  nextFocusNode: cityFN,
                  onSaved: (r) => request = r,
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 12,
              sm: 6,
              md: 3,
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: InputBox(
                  hintText: 'City',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  focusNode: cityFN,
                  onSaved: (c) => city = c,
                  submitAction: submitForm,
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 12,
              sm: 6,
              md: 3,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: BaseButton(
                  onPressed: () => submitForm(),
                  buttonText: 'Find vacancies',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}