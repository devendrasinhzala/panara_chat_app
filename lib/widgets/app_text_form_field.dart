import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/app_text_style.dart';
import '../values/colors.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.focusNode,
    this.validator,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: AppTextStyle.textMediumSF.copyWith(
        color: AppColors.primary,
        fontSize: 15.sp,
      ),
      obscureText: widget.obscureText,
      obscuringCharacter: '\u2022',
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyle.textMediumSF.copyWith(
          color: AppColors.primary65,
          fontSize: 15.sp,
        ),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: widget.suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: 1.r,
            color: AppColors.accent40,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: 1.r,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
