import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobsearch_client/model/model.dart';
import 'package:jobsearch_client/utils/utils.dart';
import 'components.dart';
import 'package:provider/provider.dart';

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
                      FindVacanciesButton(),
                      PostCVButton(),
                      context.watch<User>() != null ? ProfileButton()
                          : LoginButton(),
//                      FlatButton(
//                        onPressed: () => Navigator.popUntil(context,
//                            ModalRoute.withName(Navigator.defaultRouteName)),
//                        child: Text(
//                          "Home",
//                          style: buttonTextStyle,
//                        ),
//                        splashColor: Colors.transparent,
//                        hoverColor: Colors.transparent,
//                        highlightColor: Colors.transparent,
//                      ),
//                      FlatButton(
//                        onPressed: () => Navigator.pushNamed(context, Routes.profile),
//                        child: Text(
//                          context.watch<User>() != null ? '${context.watch<User>().firstName} ${context.watch<User>().lastName}'
//                          : 'context.watch<Client>().currentUser',
//                          style: buttonTextStyle,
//                        ),
//                        splashColor: Colors.black26,
//                        hoverColor: Colors.black12,
//                        highlightColor: Colors.transparent,
//                      ),

//                      FlatButton(
//                        onPressed: () {},
//                        child: Text(
//                          "About",
//                          style: buttonTextStyle,
//                        ),
//                        splashColor: Colors.transparent,
//                        hoverColor: Colors.transparent,
//                        highlightColor: Colors.transparent,
//                      ),
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

class FindVacanciesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseMenuButton(
      onPressed: () => Navigator.pushNamed(context, Routes.vacancies),
      child: Text(
        'Find vacancies',
        style: buttonTextStyle,
      ),
    );
  }
}

class PostCVButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseMenuButton(
      onPressed: () => Navigator.pushNamed(context,
          context.read<User>() != null ? Routes.createCV
              : Routes.signup
      ),
      child: Text(
        'Post resume',
        style: buttonTextStyle,
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseMenuButton(
      onPressed: () => Navigator.pushNamed(context, Routes.login),
      child: Text(
        'Login',
        style: buttonTextStyle,
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseMenuButton(
      onPressed: () => Navigator.pushNamed(context, Routes.profile),
      child: Text(
        '${context.watch<User>().firstName} ${context.watch<User>().lastName}',
        style: buttonTextStyle,
      ),
    );
  }
}

class BaseMenuButton extends StatelessWidget {
  const BaseMenuButton({
    Key key, @required this.onPressed, @required this.child,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: child,
      splashColor: Colors.black12,
      hoverColor: Color(0xFFf2f3f4),
      highlightColor: Colors.transparent,
    );
  }
}

