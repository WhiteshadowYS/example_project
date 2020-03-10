import 'package:example_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  final double width;
  final double height;

  final double borderRadius;

  final EdgeInsets padding;
  final EdgeInsets margin;

  LoginTextField({
    @required this.controller,
    @required this.hintText,

    this.margin = const EdgeInsets.symmetric(
      vertical: 8,
    ),
    this.padding = const EdgeInsets.only(left: 8, right: 8),

    this.height = 50,
    this.width  = double.infinity,
    this.borderRadius = 8,
  });

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height:   widget.height,
      width:    widget.width,
      padding:  widget.padding,
      margin:   widget.margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: black.withOpacity(0.7),
          width: 1,
        ),
      ),
      child: TextField(
        controller: widget.controller ?? TextEditingController(),
        focusNode: focusNode,
        style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: black.withOpacity(0.8)
        ),
        decoration: InputDecoration(
          hintText: widget.hintText ?? '',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

