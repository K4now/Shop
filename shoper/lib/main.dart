import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shoper/Login/Register/auth_controller.dart';
import 'package:shoper/Login/Register/login_page.dart';
import 'package:shoper/Login/Register/signup_page.dart';
import 'package:get/get.dart';
import 'package:shoper/Login/Register/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
