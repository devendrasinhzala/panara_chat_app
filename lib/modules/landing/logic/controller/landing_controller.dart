import 'package:chat_application/api/api_endpoints.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';

import '../../../../models/user.dart';

class LandingController extends GetxController {
  final auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<User> usersList = <User>[].obs;

  //Search User
  searchUser(String email) async {
    final result = await _firestore
        .collection(ApiEnpoints.users)
        .where(
          'email',
          isEqualTo: email,
        )
        .get();
    usersList.add(User.fromJson(result.docs[0].data()));
    usersList.refresh();
  }

  //Chat Room Id
  String chatRoomId(String userId1, String userId2) {
    if (userId1.toLowerCase().codeUnits[0] >
        userId2.toLowerCase().codeUnits[0]) {
      return '$userId1$userId2';
    } else {
      return '$userId2$userId1';
    }
  }
}
