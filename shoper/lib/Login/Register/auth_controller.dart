import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoper/Login/Register/login_page.dart';
import 'package:shoper/Login/Register/welcome_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
//email, password...
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _inititalScreen);
  }

  _inititalScreen(User? user) {
    if (user == null) {
      print("Login page");
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage(
            email: user.email!,
          ));
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Ошибка создания аккаунта",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(e.toString()));
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Ошибка входа",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(e.toString()));
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
