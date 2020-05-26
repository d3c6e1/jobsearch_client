import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/components/components.dart';
import 'package:responsive_grid/responsive_grid.dart';

class InfoSection extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            xs: 12,
            sm: 12,
            md: 6,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'News',
                    style: headlineSecondaryTextStyle,
                  ),
                  Text(
                    '',
                    style: bodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          ResponsiveGridCol(
            xs: 12,
            sm: 6,
            md: 3,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Info',
                    style: headlineSecondaryTextStyle,
                  ),
                  Text(
                    '',
                    style: bodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          ResponsiveGridCol(
            xs: 12,
            sm: 6,
            md: 3,
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Info',
                    style: headlineSecondaryTextStyle,
                  ),
                  Text(
                    '',
                    style: bodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}