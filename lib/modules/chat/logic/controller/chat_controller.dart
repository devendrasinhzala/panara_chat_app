import 'package:chat_application/api/api_endpoints.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/user.dart';

class ChatController extends GetxController {
  final firebase_auth.FirebaseAuth auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController messageController = TextEditingController();
  final String chatRoomId = Get.arguments['chatRoomId'];
  final User user = Get.arguments['user'];

  //Send Message
  onSendMessage() async {
    Map<String, dynamic> message = {
      'sendby': auth.currentUser?.email,
      'message': messageController.text.trim(),
      'time': FieldValue.serverTimestamp(),
    };

    await firestore
        .collection(ApiEnpoints.chatRoom)
        .doc(chatRoomId)
        .collection(ApiEnpoints.chats)
        .add(message);

    messageController.clear();
  }
}
