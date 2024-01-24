import 'package:chat_application/api/api_endpoints.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../../values/strings.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwodController = TextEditingController();
  RxBool hidePassword = true.obs;
  RxBool hideConfirmPassword = true.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign Up Method
  Future<void> signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwodController.text,
      );
      if (_auth.currentUser?.email?.isNotEmpty == true) {
        Map<String, dynamic> data = {
          'email': emailController.text,
          'status': 'ofline',
        };
        await FirebaseFirestore.instance
            .collection(ApiEnpoints.users)
            .doc(_auth.currentUser?.uid)
            .set(data);
        Get.offAllNamed(
          AppRoutes.landing,
        );
      } else {
        Get.rawSnackbar(
          message: Strings.somethingWentWrong,
        );
      }
    } on FirebaseAuthException catch (e) {
      Get.rawSnackbar(
        message: e.message,
      );
    } catch (e) {
      Get.rawSnackbar(
        message: e.toString(),
      );
    }
  }
}
