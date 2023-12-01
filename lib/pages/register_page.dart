import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  bool isValidEmail(String email) {
    // Implement your email validation logic here.
    // Return true if the email is valid, otherwise, return false.
    // You can use a regular expression or any other method to validate the email.
    // Here's a simple example using a regular expression:
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegExp.hasMatch(email);
  }

  //sign up user
  void signUp() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Make sure passwords match
    if (passwordTextController.text != confirmPasswordTextController.text) {
      // Pop loading circle
      Navigator.pop(context);
      // Show error to the user
      displayMessage("Senhas não conferem ");
      return;
    }

    // Check if the password meets the minimum length requirement
    if (passwordTextController.text.length < 6) {
      // Pop loading circle
      Navigator.pop(context);
      // Show error to the user
      displayMessage("Password should be at least 6 characters");
      return;
    }

    if (!isValidEmail(emailTextController.text)) {
      // Close loading circle
      Navigator.pop(context);
      // Show error to the user
      displayMessage("E-mail inválido");
      return;
    }

    // Create the user
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );

      // Pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop loading circle
      Navigator.pop(context);
      displayMessage(e.code);
    }

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(emailTextController.text)
        .set({
      'username': emailTextController.text.split('@')[0],
      'bio': 'Empty bio...',
    });
  }

  //display a dialog message
  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 31, 89, 1.0),
        body: SingleChildScrollView(
            child: Center(
                child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              //logo
              Image.asset(
                'lib/assets/images/lock.png',
                width: 200,
                height: 200,
              ),

              const SizedBox(height: 40),

              //welcome back message
              const Text(
                "Vamos criar uma conta no MyDown!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 25),

              //email textfield
              MyTextField(
                  controller: emailTextController,
                  hintText: 'Email',
                  obscureText: false),

              const SizedBox(height: 25),

              //password textfield
              MyTextField(
                  controller: passwordTextController,
                  hintText: 'Senha',
                  obscureText: true),

              const SizedBox(height: 20),

              //password confirm textfield
              MyTextField(
                  controller: confirmPasswordTextController,
                  hintText: 'Confirme sua Senha',
                  obscureText: true),

              const SizedBox(height: 20),

              //SIGNUP Button
              MyButton(onTap: signUp, text: "Registrar"),

              const SizedBox(height: 10),

              //go to register page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Já possui uma conta?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Entre já",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(230, 171, 27, 1.0)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ))));
  }
}
