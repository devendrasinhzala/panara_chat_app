import 'package:chat_application/modules/landing/view/landing_screen.dart';
import 'package:get/get.dart';

import '../modules/login/logic/binding/login_binding.dart';
import '../modules/login/view/login_screen.dart';
import '../modules/sign_up/logic/binding/sign_up_binding.dart';
import '../modules/sign_up/view/sign_up_screen.dart';

class AppRoutes {
  static String login = '/login';
  static String signUp = '/sign_up';
  static String landing = '/landing';

  static final getPages = [
    GetPage(
      name: login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: signUp,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: landing,
      page: () => const LandingScreen(),
    ),
  ];
}
