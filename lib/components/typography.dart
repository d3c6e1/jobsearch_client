import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components.dart';

TextStyle headlineTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 26,
        color: textPrimary,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w300));

TextStyle headlineSecondaryTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 20, color: textPrimary, fontWeight: FontWeight.w300));

TextStyle subtitleTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(fontSize: 14, color: textSecondary, letterSpacing: 1));

TextStyle bodyTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(fontSize: 14, color: textPrimary));

TextStyle buttonTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 14, color: textPrimary, letterSpacing: 1,));

TextStyle headlineThemeTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 26,
        color: textThemeAccent,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w300));

TextStyle headlineSecondaryThemeTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 20, color: textThemeAccent, fontWeight: FontWeight.w300));

TextStyle subtitleThemeTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(fontSize: 14, color: textThemeAccent, letterSpacing: 1));

TextStyle bodyThemeTextStyle = GoogleFonts.openSans(
    textStyle: TextStyle(fontSize: 14, color: textThemeAccent));

TextStyle buttonThemeTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(fontSize: 14, color: textThemeAccent, letterSpacing: 1,));