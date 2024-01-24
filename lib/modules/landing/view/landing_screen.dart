import 'package:chat_application/modules/landing/logic/controller/landing_controller.dart';
import 'package:chat_application/modules/landing/view/widgets/user_list_item.dart';
import 'package:chat_application/routes/app_routes.dart';
import 'package:chat_application/values/app_text_style.dart';
import 'package:chat_application/widgets/app_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../values/colors.dart';
import '../../../values/strings.dart';

class LandingScreen extends GetView<LandingController> {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accent,
        title: Text(
          Strings.chat,
          style: AppTextStyle.textBold.copyWith(
            fontSize: 17.sp,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Get.offAllNamed(
                AppRoutes.login,
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 36.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.h.verticalSpace,
            const Text('Search user using mail id'),
            AppTextFormField(
              hintText: 'Enter email',
              onChanged: (value) {
                if (value.isEmail) {
                  controller.searchUser(value);
                }
              },
            ),
            20.h.verticalSpace,
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.usersList.length,
                  itemBuilder: (context, index) {
                    return UserListItem(
                      index: index,
                      user: controller.usersList[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
