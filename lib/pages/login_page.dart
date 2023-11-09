import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_down_project/components/button.dart';
import 'package:my_down_project/components/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  // sign user in
  void signIn() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );

      // Pop loading circle
      Navigator.pop(context);
    } catch (e) {
      // Pop loading circle
      Navigator.pop(context);

      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          // Display error message for user not found
          displayMessage('Usuário não encontrado. Verifique suas credenciais.');
        } else if (e.code == 'wrong-password') {
          // Display error message for wrong password
          displayMessage('Senha incorreta. Verifique suas credenciais.');
        } else {
          // Display a generic error message for other FirebaseAuthExceptions
          displayMessage(
              'Ocorreu um erro durante o login. Tente novamente mais tarde.');
        }
      } else {
        // Handle other types of exceptions here
        displayMessage(
            'Ocorreu um erro durante o login. Tente novamente mais tarde.');
      }
    }
  }

  // display a dialog message
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
      backgroundColor: Color.fromRGBO(0, 31, 89, 1.0),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                // logo
                Image.asset(
                  'lib/assets/images/lock.png',
                  width: 200,
                  height: 200,
                ),

                const SizedBox(height: 40),

                // welcome back message
                Text(
                  "Bem-Vindo(a) ao MyDown!",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 25),

                MyTextField(
                  controller: emailTextController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 25),

                MyTextField(
                  controller: passwordTextController,
                  hintText: 'Senha',
                  obscureText: true,
                ),

                const SizedBox(height: 20),

                // SIGNIN Button
                MyButton(onTap: signIn, text: "Entrar"),

                const SizedBox(height: 10),

                // go to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ainda não possui uma conta?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Registre-se agora",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(230, 171, 27, 1.0),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
