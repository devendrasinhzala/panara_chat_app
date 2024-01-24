import 'package:chat_application/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/user.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.index,
    required this.user,
  });

  final int index;
  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed(
          AppRoutes.chat,
        );
      },
      title: Text(user.email ?? ''),
    );
  }
}
