import 'package:flutter/material.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/pages/pages.dart';
import 'package:jobsearch_client/utils/utils.dart';
import 'package:provider/provider.dart';

class MyResumesPage extends StatefulWidget{
  static const String route = '/my/resumes';

  @override
  State<StatefulWidget> createState() => _MyResumesPageState();
}

class _MyResumesPageState extends State<MyResumesPage>{
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      widgets: [
        MenuBar(),
        SizedBox(
          height: 20,
        ),
        _MyResumesHeader(),
        divider,
        _MyResumes(),
        CreateResumeButton(),
        divider,
        Footer(),
      ],
    );
  }
}

class _MyResumes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return context.select((User u) => u?.cvs?.isNotEmpty) ?
        _ResumesList() :
        CreateResumeSection();
  }
}

class _ResumesList extends StatefulWidget{
  @override
  __ResumesListState createState() => __ResumesListState();
}

class __ResumesListState extends State<_ResumesList> {
  @override
  Widget build(BuildContext context) {
    final List<CV> resumes = context.select((User u) => u?.cvs);
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: resumes.length,
        itemBuilder: (BuildContext context, int index){
          return Column(
            children: [
              Container(
                child: ListTile(
                  title: Text(
                      '${resumes[index].name}',
                    style: headlineSecondaryTextStyle,
                  ),
                  subtitle: Text(
                    'Published: ${Formatting.formatDate(resumes[index].publishDate.toLocal())}',
                    style: subtitleTextStyle,
                  ),
                  trailing: DeleteResumeButton(
                    resumeID: resumes[index].id,
                  ),
                  hoverColor: ThemeConfig.lightShade,
                  onTap: (){
                    
                    return Navigator.pushNamed(context, ResumePage.route);
                  },
                ),
              ),
              divider,
            ],
          );
        }
      ),
    );
  }
}


class _MyResumesHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BasePageHeader(
      title: 'My resumes',
    );
  }
}