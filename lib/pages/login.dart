import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/routes.dart';
import 'package:jobsearch_client/utils/utils.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool validate = false;
  String email, password;

  FocusNode emailFN = FocusNode();
  FocusNode passFN = FocusNode();

  String errorMessage = "";
  StreamSubscription userSubscription;

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
      Store.instance.userController.login(email, password)
        .catchError((e){
          setState(() {
            loading = false;
          });
        });
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  @override
  void initState() {
    super.initState();

    userSubscription = Store.instance.userController.listen((user) {
      if (mounted && user != null) {
        Navigator.pushNamed(context, Routes.home);
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
    passFN.dispose();
    super.dispose();
    userSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widgets: <Widget>[
        MenuBar(),
        _buildForm(),
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
              "Welcome Back",
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
                    textInputAction: TextInputAction.done,
                    focusNode: passFN,
                    obscureText: true,
                    validateFunction: Validations.validatePassword,
                    onSaved: (String val) {
                      password = val;
                    },
                    submitAction: submitForm,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MouseCursor(
                        child: GestureDetector(
                          onTap: loading?null:()=>Navigator.pushNamed(context, Routes.signup),
                          child: Text(
                            "No account? Sign Up",
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
                              "Login",
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