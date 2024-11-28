import 'package:budget/src/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.padding,
    required this.borderRadius,
    required this.textInputType,
    required this.cursorColor,
  });

  final String hintText;
  final EdgeInsets padding;
  final double borderRadius;
  final Color cursorColor;
  final TextInputType textInputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        cursorColor: cursorColor,
        onTapOutside: (_){
          FocusScope.of(context).unfocus();
        },
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: context.appColors.colorPrimary,
          hintStyle: context.appFonts.customFont(
              fontSize: FontSize.s15,
              fontWeight: FontWeight.w500,
              color: context.appColors.colorSecondaryText),
          hintText: hintText,
        ),
        style: context.appFonts.customFont(
            fontSize: FontSize.s15,
            fontWeight: FontWeight.w500,
            color: context.appColors.colorPrimaryText),
      ),
    );
  }
}