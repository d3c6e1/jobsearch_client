import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/pages/my_resumes.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ResumeSection extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ResumeSectionState();
}

class _ResumeSectionState extends State<ResumeSection>{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: context.watch<User>() != null ? _LoginedSection()
          : CreateResumeSection(),
    );
  }
}

class _LoginedSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            sm: 12,
            md: 9,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My resume',
                    style: headlineTextStyle,
                  ),
                  // TODO
                  Text(
                    'You now have ${context.select((User u) => u?.cvs?.length)} resumes',
                    style: subtitleTextStyle,
                  ),
                ],
              ),
            ),
          ),
          ResponsiveGridCol(
            sm: 12,
            md: 3,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: BaseButton(
                  onPressed: () => Navigator.pushNamed(context, MyResumesPage.ROUTE),
                  buttonText: 'My resumes',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateResumeSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            sm: 12,
            md: 9,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Post resume',
                    style: headlineTextStyle,
                  ),
                  Text(
                    'Employers will be able to find you and offer you a job',
                    style: subtitleTextStyle,
                  ),
                ],
              ),
            ),
          ),
          ResponsiveGridCol(
            sm: 12,
            md: 3,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: CreateResumeButton(),
            ),
          )
        ],
      ),
    );
  }
}