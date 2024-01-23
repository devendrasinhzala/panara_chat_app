import 'package:get/get.dart';

import '../modules/login/logic/binding/login_binding.dart';
import '../modules/login/view/login_screen.dart';

class AppRoutes {
  static String login = '/login';

  static final getPages = [
    GetPage(
      name: login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
