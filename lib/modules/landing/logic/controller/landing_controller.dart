import 'package:chat_application/api/api_endpoints.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../models/user.dart';

class LandingController extends GetxController {
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
}
