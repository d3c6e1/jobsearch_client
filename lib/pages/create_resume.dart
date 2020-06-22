import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/extensions/extensions.dart';
import 'package:jobsearch_client/services/services.dart';
import 'package:jobsearch_client/utils/utils.dart';
import 'package:provider/provider.dart';

class CreateResumePage extends StatefulWidget{
  static const String ROUTE = '/resume/create';

  @override
  State<StatefulWidget> createState() => _CreateResumePageState();
}

class _CreateResumePageState extends State<CreateResumePage>{

  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool validate = false;

  CV _cv = CV();
  CVData _cvData = CVData();
  //TODO implement
//  Map<String, String> _skills = Map();

  DateTime _jobDateFrom, _jobDateTo, _eduDateFrom, _eduDateTo;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      children: [
        MenuBar(),
        SizedBox(
          height: 20.0,
        ),
        _form(context.select((User user) => user)),
        divider,
        Footer(),
      ],
    );
  }

  submitForm(User user) async {
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

      _cv
        ..publishDate = DateTime.now()
        ..owner = user.id
        ..data = _cvData;

      Store.instance.cvController.createResume(_cv).catchError((e){
        setState(() {
          loading = false;
        });
      });

      setState(() {
        loading = false;
      });
    }
  }

  showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  _form(User user){
    return Container(
      width: 700,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: formKey,
              autovalidate: validate,
              child: Column(
                children: [
                  _paragraph('Basic information'),
                  InputBox(
                    hintText: 'The position you want to work in',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validateFunction: Validations.validateString,
                    onSaved: (String str) => _cv.name = str,
                  ),
                  SizedBox(height: 10,),
                  divider,
                  _paragraph('Experience'),
                  InputBox(
                    hintText: 'Company name',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validateFunction: Validations.validateString,
                    onSaved: (String str) => _cvData.jobExperience = {'companyName': str},
                  ),
                  SizedBox(height: 10,),
                  InputBox(
                    hintText: 'City',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validateFunction: Validations.validateString,
                    onSaved: (String str) => _cvData.jobExperience.addAll({'city': str}),
                  ),
                  SizedBox(height: 10,),
                  InputBox(
                    hintText: 'Position',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validateFunction: Validations.validateString,
                    onSaved: (String str) => _cvData.jobExperience.addAll({'position': str}),
                  ),
                  SizedBox(height: 10,),
                  InputBox(
                    hintText: 'Scope of the company',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validateFunction: Validations.validateString,
                    onSaved: (String str) => _cvData.jobExperience.addAll({'scope': str}),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      InputBox(
                        hintText: _jobDateFrom != null ?
                        _jobDateFrom.date :
                          'Work period from',
                        boxWidth: 150,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.none,
                        enabled: false,
                        onSaved: (_) => _cvData.jobExperience.addAll({'dateFrom': _jobDateFrom}),
                      ),
                      SizedBox(width: 10,),
                      BaseButton(
                        buttonText: 'Select date',
                        onPressed: () => _selectDate().then((DateTime date) {
                          setState(() {
                            _jobDateFrom = date;
                          });
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      InputBox(
                        hintText: _jobDateTo != null ?
                        _jobDateTo.date :
                          'Work period to',
                        boxWidth: 150,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.none,
                        enabled: false,
                        onSaved: (_) => _cvData.jobExperience.addAll({'dateTo': _jobDateTo}),
                      ),
                      SizedBox(width: 10,),
                      BaseButton(
                        buttonText: 'Select date',
                        onPressed: () => _selectDate().then((DateTime date) {
                          setState(() {
                            _jobDateTo = date;
                          });
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  InputBox(
                    hintText: 'Responsibilities and achievements in this position',
                    textInputType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                    onSaved: (String str) => _cvData.jobExperience.addAll({'achievements': str}),
                  ),
                  SizedBox(height: 10,),
                  divider,
                  _paragraph('Education'),
                  InputBox(
                    hintText: 'Educational institution',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validateFunction: Validations.validateString,
                    onSaved: (String str) => _cvData.education = {'educationalInstitution': str},
                  ),
                  SizedBox(height: 10,),
                  InputBox(
                    hintText: 'Faculty, specialty',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validateFunction: Validations.validateString,
                    onSaved: (String str) => _cvData.education.addAll({'specialty': str}),
                  ),
                  SizedBox(height: 10,),
                  InputBox(
                    hintText: 'City',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validateFunction: Validations.validateString,
                    onSaved: (String str) => _cvData.education.addAll({'city': str}),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      InputBox(
                        hintText: _eduDateFrom != null ?
                        _eduDateFrom.date :
                          'Period of study from',
                        boxWidth: 170,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.none,
                        enabled: false,
                        onSaved: (_) => _cvData.education.addAll({'dateFrom': _eduDateFrom}),
                      ),
                      SizedBox(width: 10,),
                      BaseButton(
                        buttonText: 'Select date',
                        onPressed: () => _selectDate().then((DateTime date) {
                          setState(() {
                            _eduDateFrom = date;
                          });
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      InputBox(
                        hintText: _eduDateTo != null ?
                        _eduDateTo.date :
                          'Period of study to',
                        boxWidth: 170,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.none,
                        enabled: false,
                        onSaved: (_) => _cvData.education.addAll({'dateTo': _eduDateTo}),
                      ),
                      SizedBox(width: 10,),
                      BaseButton(
                        buttonText: 'Select date',
                        onPressed: () => _selectDate().then((DateTime date) {
                          setState(() {
                            _eduDateTo = date;
                          });
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  InputBox(
                    hintText: 'Details',
                    textInputType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                    onSaved: (String str) => _cvData.education.addAll({'details': str}),
                  ),
//                  SizedBox(height: 10,),
//                  divider,
//                  _paragraph('Skills'),
//                  InputBox(
//                    hintText: '',
//                    textInputType: TextInputType.text,
//                    textInputAction: TextInputAction.none,
//                    enabled: false,
//                    onSaved: (_) => _cvData.skills = _skills,
//                  ),
                  SizedBox(height: 10,),
                  divider,
                  _paragraph('Additional information'),
                  InputBox(
                    textInputType: TextInputType.multiline,
                    textInputAction: TextInputAction.none,
                    onSaved: (String str) => _cvData.additionalData = str,
                  ),
                  SizedBox(height: 10,),
                  divider,
                  SizedBox(height: 10,),
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
                        onPressed: ()=> submitForm(user),
                        child: Text(
                          "Post resume",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime> _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now(),
    );
    return picked;
  }
}

Widget _paragraph(String text){
  return BasePageHeader(
    title: text,
  );
}