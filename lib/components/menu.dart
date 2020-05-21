import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.popUntil(
                    context, ModalRoute.withName(Navigator.defaultRouteName)),
                child: Text("JOB SEARCH",
                    style: GoogleFonts.montserrat(
                        color: textPrimary,
                        fontSize: 30,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w500)),
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () => Navigator.popUntil(context,
                            ModalRoute.withName(Navigator.defaultRouteName)),
                        child: Text(
                          "Home",
                          style: buttonTextStyle,
                        ),
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Profile",
                          style: buttonTextStyle,
                        ),
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      LoginButton(),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "About",
                          style: buttonTextStyle,
                        ),
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 1,
            margin: EdgeInsets.only(bottom: 30),
            color: Color(0xFFEEEEEE)),
      ],
    );
  }
}
