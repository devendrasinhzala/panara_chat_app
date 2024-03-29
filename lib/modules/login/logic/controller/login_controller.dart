import 'package:chat_application/routes/app_routes.dart';
import 'package:chat_application/values/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwodController = TextEditingController();
  RxBool hidePassword = true.obs;

//Log In Method
  Future<void> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
