import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_down_project/auth/auth.dart';
import 'package:my_down_project/firebase_options.dart';
import 'package:my_down_project/pages/mydown.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyDown(),
    );
  }
}
