import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobsearch_client/routes.dart';
import 'components.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () =>
          Navigator.pushNamed(context, Routes.login),
      child: Text(
        "Login",
        style: buttonTextStyle,
      ),
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}

class ListItem extends StatelessWidget {
  // TODO replace with Post item model.
  final String imageUrl;
  final String title;
  final String description;
  final String dest;

  const ListItem(
      {Key key, this.imageUrl, @required this.title, this.description, this.dest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (imageUrl != null)
          Container(
            child: ImageWrapper(
              image: imageUrl,
            ),
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: marginBottom12,
            child: Text(
              title,
              style: headlineTextStyle,
            ),
          ),
        ),
        if (description != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: marginBottom12,
              child: Text(
                description,
                style: bodyTextStyle,
              ),
            ),
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: marginBottom24,
            child: DetailsButton(
              onPressed: () => Navigator.pushNamed(context, dest),
            ),
          ),
        ),
      ],
    );
  }
}

class ImageWrapper extends StatelessWidget {
  final String image;

  const ImageWrapper({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO Listen to inherited widget width updates.
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      child: Image.asset(
        image,
        width: width,
        height: width / 1.618,
        fit: BoxFit.cover,
      ),
    );
  }
}

class DetailsButton extends StatelessWidget {
  final Function onPressed;

  const DetailsButton({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hover = false;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return MouseRegion(
          onHover: (event) => setState(() => hover = true),
          onExit: (event) => setState(() => hover = false),
          child: OutlineButton(
            onPressed: onPressed,
            highlightedBorderColor: textPrimary,
            hoverColor: textPrimary,
            borderSide: BorderSide(color: textPrimary, width: 2),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Details",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 14,
                    color: hover ? Colors.white : textPrimary,
                    letterSpacing: 1),
              ),
            ),
          ),
        );
      });
  }
}
