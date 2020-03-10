import 'package:example_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalButton extends StatelessWidget {
  final String text;

  final void Function() onPressed;

  final double width;
  final double height;

  final Color buttonColor;

  final EdgeInsets margin;

  GlobalButton({
    this.text         = '',
    this.margin       = const EdgeInsets.symmetric(
      vertical: 8,
    ),
    this.width        = double.infinity,
    this.height       = 56,
    this.buttonColor  = primary,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      color:  buttonColor,
      width:  width,
      height: height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap:        onPressed,
          splashColor:  white,
          child: Container(
            alignment: Alignment.center,
            width:  double.infinity,
            height: double.infinity,
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize:   24,
                color:      white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
