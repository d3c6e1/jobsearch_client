import 'package:flutter/widgets.dart';
import 'package:jobsearch_client/components/components.dart';

class Footer extends StatelessWidget {
  // TODO Add additional footer components (i.e. about, links, logos).
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextBody(text: "Copyright © 2020"),
      ),
    );
  }
}