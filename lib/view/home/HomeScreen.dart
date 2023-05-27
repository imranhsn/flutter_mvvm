import 'package:flutter/material.dart';

import '../../res/style/TextStyles.dart';

class HomeScreen extends StatelessWidget {
  static final String id = "home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: const Text(
      "Home Screen",
      style: TextStyles.body,
    ));
  }
}
