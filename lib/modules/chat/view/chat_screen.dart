import 'package:chat_application/api/api_endpoints.dart';
import 'package:chat_application/modules/chat/view/widgets/chat_tile.dart';
import 'package:chat_application/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../values/app_text_style.dart';
import '../../../values/colors.dart';
import '../logic/controller/chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.accent,
        title: Text(
          controller.user.email ?? '',
          style: AppTextStyle.textBold.copyWith(
            fontSize: 17.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: controller.firestore
                  .collection(ApiEnpoints.chatRoom)
                  .doc(controller.chatRoomId)
                  .collection(ApiEnpoints.chats)
                  .orderBy(
                    'time',
                    descending: false,
                  )
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length ?? 0,
                    itemBuilder: (context, index) {
                      return ChatTile(
                        chatData: snapshot.data?.docs[index].data() ?? {},
                      );
                    },
                  );
                } else {
                  return const Text('Start a conversation');
                }
              },
            ),
          ),
          AppTextFormField(
            controller: controller.messageController,
            suffixIcon: IconButton(
              onPressed: () {
                if (controller.messageController.text.trim().isEmpty) {
                  Get.rawSnackbar(message: 'Please enter message');
                } else {
                  controller.onSendMessage();
                }
              },
              icon: const Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
