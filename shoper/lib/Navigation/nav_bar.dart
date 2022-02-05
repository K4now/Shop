import 'package:flutter/material.dart';
import 'package:shoper/Login/Register/auth_controller.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Drawer(
      child: ListView(children: [
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Главная'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Корзина'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Профиль'),
          onTap: () => null,
        ),
      ]),
    );
  }
}
