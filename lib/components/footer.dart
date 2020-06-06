import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/components/components.dart';

class Footer extends StatelessWidget {
  // TODO Add additional footer components (i.e. about, links, logos).
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.only(bottom: 24),
          child: Text(
            'Copyright © 2020',
            style: bodyTextStyle,
          ),
        )        ,
      ),
    );
  }
}