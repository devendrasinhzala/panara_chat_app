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

  //Sign Up Method
  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwodController.text,
      );
      if (FirebaseAuth.instance.currentUser?.email?.isNotEmpty == true) {
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
