import 'package:eventlyapp/utils/app_color.dart';
import 'package:eventlyapp/utils/app_style.dart';
import 'package:flutter/material.dart';

typedef onValidator = String? Function(String?)?;

class CustomTextformfiled extends StatelessWidget {
  CustomTextformfiled(
      {super.key,
      this.borderSideColor,
      this.hintText,
      this.hintStyle,
      this.labelText,
      this.labelStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixIconColor,
      this.suffixIconColor,
      this.focusedBorderSideColor = AppColor.primaryLightColor,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.isObscured = false,
      required this.controller,
      this.textStyle,
      this.maxLines});

  Color? borderSideColor;
  Color focusedBorderSideColor;
  String? hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? prefixIconColor;
  Color? suffixIconColor;
  onValidator? validator;
  TextInputType? keyboardType;
  bool isObscured;
  TextEditingController controller;
  TextStyle? textStyle;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: isObscured ? 1 : maxLines,
        style: textStyle ?? Theme.of(context).textTheme.bodySmall,
        controller: controller,
        validator: validator,
        obscureText: isObscured,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium,
          labelText: labelText,
          labelStyle: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixIconColor: prefixIconColor ?? Theme.of(context).hoverColor,
          suffixIconColor: suffixIconColor ?? Theme.of(context).hoverColor,
          enabledBorder: buildOutLineInputBorder(
              borderSideColor:
                  borderSideColor ?? Theme.of(context).shadowColor),
          focusedBorder:
              buildOutLineInputBorder(borderSideColor: focusedBorderSideColor),
          errorBorder:
              buildOutLineInputBorder(borderSideColor: AppColor.logoutColor),
          focusedErrorBorder: buildOutLineInputBorder(
            borderSideColor: AppColor.logoutColor,
          ),
        ));
  }
}

OutlineInputBorder buildOutLineInputBorder({required Color borderSideColor}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: borderSideColor, width: 1));
}
