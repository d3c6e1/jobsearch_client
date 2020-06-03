import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/components/typography.dart';

class BasePageHeader extends StatelessWidget {
  final String title, subtitle;

  const BasePageHeader({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: headlineThemeTextStyle,
          ),
          Text(
            subtitle ?? '',
            style: subtitleTextStyle,
          ),
        ],
      ),
    );
  }
}