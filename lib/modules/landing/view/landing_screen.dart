import 'package:chat_application/modules/landing/logic/controller/landing_controller.dart';
import 'package:chat_application/modules/landing/view/widgets/user_list_item.dart';
import 'package:chat_application/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends GetView<LandingController> {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          AppTextFormField(
            onChanged: (value) {
              if (value.isEmail) {
                controller.searchUser(value);
              }
            },
          ),
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
    );
  }
}
