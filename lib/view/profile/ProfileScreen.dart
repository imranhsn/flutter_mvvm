import 'package:flutter/material.dart';

import '../../res/style/TextStyles.dart';

class ProfileScreen extends StatelessWidget {
  static final String id = "profile_screen";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: const Text(
      "Profile Screen",
      style: TextStyles.body,
    ));
  }
}
