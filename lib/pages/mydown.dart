import 'package:flutter/material.dart';
import 'package:my_down_project/auth/auth.dart';
// Importe o arquivo login_page.dart

class MyDown extends StatelessWidget {
  const MyDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 33, 85),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20, 61, 137, 1.0),
        title: const Text('My Down'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AuthPage(),
              ),
            );
          },
          child: Image.asset(
            'lib/assets/images/icon.png',
            width: 450,
            height: 450,
          ),
        ),
      ),
    );
  }
}
