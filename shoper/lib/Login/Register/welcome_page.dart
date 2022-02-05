import 'package:flutter/material.dart';
import 'package:shoper/Login/Register/auth_controller.dart';
import 'package:shoper/Navigation/nav_bar.dart';

class WelcomePage extends StatelessWidget {
  String email;
  WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      drawer: NavBar(),
      body: SafeArea(
        child: Column(
          children: [
            Text(email),
            SizedBox(
              height: h / 1.5,
            ),
            GestureDetector(
              onTap: () {
                AuthController.instance.logOut();
              },
              child: Center(
                child: Container(
                  child: Text(
                    "Exit",
                    style: TextStyle(fontSize: 35),
                  ),
                  height: h * 0.08,
                  width: w * 0.8,
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
