import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../values/app_text_style.dart';
import '../../logic/controller/chat_controller.dart';

class ChatTile extends GetView<ChatController> {
  const ChatTile({super.key, required this.chatData});

  final Map chatData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          chatData['sendby'] == controller.auth.currentUser?.email
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
      children: [
        Card(
          margin: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 8.h,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.blue.shade100,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 5.h,
            ),
            child: Text(
              chatData['message'],
              style: AppTextStyle.textRegular.copyWith(
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
