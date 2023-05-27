import 'package:mvvm_test/view/MainScreen.dart';
import 'package:mvvm_test/view/review/ReviewScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/notification/NotificationMain.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        ReviewScreen.id: (context) => ReviewScreen(
            ModalRoute.of(context)!.settings.arguments as NotificationModel),
      },
    );
  }
}
