import 'package:flutter/material.dart';

import '../../res/style/TextStyles.dart';

class BookingScreen extends StatelessWidget {
  static final String id = "booking_screen";

  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: const Text(
      "Booking Screen",
      style: TextStyles.body,
    ));
  }
}
