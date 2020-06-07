import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/pages/pages.dart';
import 'package:jobsearch_client/services/services.dart';
import 'package:jobsearch_client/utils/utils.dart';


class SignUpPage extends StatefulWidget {
  static const String ROUTE = '/register';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool validate = false;
  String email, password, confirmPassword, fName, lName;

  FocusNode emailFN = FocusNode();
  FocusNode fNameFN = FocusNode();
  FocusNode lNameFN = FocusNode();
  FocusNode passFN = FocusNode();
  FocusNode confirmPassFN = FocusNode();

  StreamSubscription userSubscription;
  String errorMessage = "";

  submitForm() async{
    FormState form = formKey.currentState;
    form.save();
    if (!form.validate()) {
      setState(() {
        validate = true;
      });
      showInSnackBar("Please fix the errors in red before submitting.");
    } else {
      setState(() {
        loading = true;
      });
      Store.instance.userController.register(email, password, email, fName, lName)
        .catchError((e){
          setState(() {
            loading = false;
          });
        });

      setState(() {
        loading = false;
      });
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  @override
  void initState(){
    super.initState();

    userSubscription = Store.instance.userController.listen((user) {
      if (mounted && user != null) {
        Navigator.pop(context);
      }
    }, onError: (Object err) {
      setState(() {
        errorMessage = err.toString();
      });
    });
  }

  @override
  void dispose() {
    emailFN.dispose();
    fNameFN.dispose();
    lNameFN.dispose();
    passFN.dispose();
    confirmPassFN.dispose();
    super.dispose();
    userSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widgets: <Widget>[
        MenuBar(),
        SizedBox(height: 20.0,),
        _buildForm(),
        divider,
        Footer(),
      ],
    );
  }

  _buildForm(){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Create Account",
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 50,),
            Form(
              key: formKey,
              autovalidate: validate,
              child: Column(
                children: <Widget>[
                  InputBox(
                    enabled: !loading,
                    hintText: "First Name",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: fNameFN,
                    validateFunction: Validations.validateName,
                    nextFocusNode: lNameFN,
                    onSaved: (String val) {
                      fName = val;
                    },
                  ),
                  SizedBox(height: 10,),
                  InputBox(
                    enabled: !loading,
                    hintText: "Last Name",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: lNameFN,
                    validateFunction: Validations.validateName,
                    nextFocusNode: emailFN,
                    onSaved: (String val) {
                      lName = val;
                    },
                  ),
                  SizedBox(height: 10,),
                  InputBox(
                    enabled: !loading,
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    focusNode: emailFN,
                    validateFunction: Validations.validateEmail,
                    nextFocusNode: passFN,
                    onSaved: (String val) {
                      email = val;
                    },
                  ),
                  SizedBox(height: 10,),
                  InputBox(
                    enabled: !loading,
                    hintText: "Password",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: passFN,
                    obscureText: true,
                    validateFunction: Validations.validatePassword,
                    nextFocusNode: confirmPassFN,
                    onSaved: (String val) {
                      password = val;
                    },
                  ),
                  SizedBox(height: 10,),
                  InputBox(
                    enabled: !loading,
                    hintText: "Confirm Password",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    focusNode: confirmPassFN,
                    obscureText: true,
                    validateFunction: (val){
                      return Validations.validateRePassword(val, password);
                    },
                    onSaved: (String val) {
                      confirmPassword = val;
                    },
                    submitAction: submitForm,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MouseCursor(
                        child: GestureDetector(
                          onTap: loading ? null : (){
                            Navigator.pushNamed(context, LoginPage.ROUTE);
                          },
                          child: Text(
                            "Already signed up? Login",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: loading
                            ? Center(child: CircularProgressIndicator())
                            : MouseCursor(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            color: Theme.of(context).accentColor,
                            onPressed: ()=>submitForm(),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}