import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../values/app_text_style.dart';
import '../../../values/colors.dart';
import '../../../values/strings.dart';
import '../../../widgets/app_text_form_field.dart';
import '../../../widgets/common_button.dart';
import '../logic/controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: 36.w,
              ),
              children: [
                Text(
                  Strings.logIn,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textBold.copyWith(
                    fontSize: 28.sp,
                    color: AppColors.primary,
                  ),
                ),
                26.h.verticalSpace,
                //Email Text Field
                AppTextFormField(
                  controller: controller.emailController,
                  hintText: Strings.email,
                  validator: (value) {
                    if (value?.trim().isEmpty == true) {
                      return 'Please enter email';
                    } else if (value?.isEmail != true) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  suffixIcon: const Icon(
                    Icons.mail,
                    color: AppColors.accent,
                  ),
                ),
                20.h.verticalSpace,
                //Password Text Field
                Obx(
                  () => AppTextFormField(
                    controller: controller.passwodController,
                    hintText: Strings.password,
                    obscureText: controller.hidePassword.value,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter password';
                      } else if ((value?.length ?? 0) < 6) {
                        return 'Password must be 6 character long';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.hidePassword.toggle();
                      },
                      icon: Icon(
                        controller.hidePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      color: AppColors.accent,
                    ),
                  ),
                ),
                20.h.verticalSpace,
                //Log In Button
                CommonButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      FocusScope.of(context).unfocus();
                      controller.login();
                    }
                  },
                  backgroundColor: AppColors.accent,
                  padding: EdgeInsets.symmetric(
                    vertical: 22.h,
                  ),
                  child: Text(
                    Strings.logIn,
                    style: AppTextStyle.textBold.copyWith(
                      color: Colors.white,
                      fontSize: 17.sp,
                    ),
                  ),
                ),
                38.h.verticalSpace,
                //Don't Have Account Redirect To Sign Up Button
                InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Get.toNamed(
                      AppRoutes.signUp,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.dontHaveAnAccount,
                        style: AppTextStyle.textRegularSF.copyWith(
                          color: AppColors.primary65,
                          fontSize: 13.sp,
                        ),
                      ),
                      Text(
                        Strings.signUp.toUpperCase(),
                        style: AppTextStyle.textBoldSF.copyWith(
                          color: AppColors.accent,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
