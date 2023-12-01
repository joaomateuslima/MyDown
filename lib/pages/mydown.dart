import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_down_project/auth/auth.dart';

class MyDown extends StatefulWidget {
  const MyDown({Key? key}) : super(key: key);

  @override
  _MyDownState createState() => _MyDownState();
}

class _MyDownState extends State<MyDown> {
  @override
  void initState() {
    super.initState();

    // Adiciona um atraso de 3 segundos antes de navegar para AuthPage
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 33, 85, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(20, 61, 137, 1.0),
        title: const Text('My Down'),
      ),
      body: Center(
        child: Image.asset(
          'lib/assets/images/icon.png',
          width: 450,
          height: 450,
        ),
      ),
    );
  }
}
