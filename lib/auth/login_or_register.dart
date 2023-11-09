import 'package:flutter/material.dart';
import 'package:my_down_project/pages/register_page.dart';

import '../pages/login_page.dart';

class LoginOrgRegister extends StatefulWidget {
  const LoginOrgRegister({super.key});

  @override
  State<LoginOrgRegister> createState() => _LoginOrgRegisterState();
}

class _LoginOrgRegisterState extends State<LoginOrgRegister> {
//inittialy, show the login page
  bool showLoginPage = true;

  //toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
