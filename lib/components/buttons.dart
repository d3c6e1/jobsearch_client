import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components.dart';

class BaseButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;

  const BaseButton({Key key, @required this.onPressed, this.buttonText}) : super(key: key);

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
                buttonText ?? 'Press',
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