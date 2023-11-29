import 'package:flutter/material.dart';
import 'package:my_down_project/pages/home_page.dart';
import 'package:my_down_project/pages/wordsgame.dart';

class TalkPage extends StatefulWidget {
  const TalkPage({Key? key}) : super(key: key);

  @override
  TalkPageState createState() => TalkPageState();
}

class TalkPageState extends State<TalkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(171, 255, 247, 0),
        title: const Text(
          "Fala",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 249, 247, 190),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            //Alimentacao
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  // ignore: prefer_const_constructors
                  MaterialPageRoute(builder: (context) => WordsGame()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 253, 253, 150),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Jogo das Palavras",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/animais.png',
                      width: 110,
                    ),
                  ],
                ),
              ),
            ),

            //Fala
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 253, 253, 150),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Frases",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 26,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/conversa.png',
                      width: 110,
                    ),
                  ],
                ),
              ),
            ),

            //Coordenacao Motora
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 253, 253, 150),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Roteiro de teatro",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/teatro.png',
                      width: 130,
                    ),
                  ],
                ),
              ),
            ),

            //Area cognitiva
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 253, 253, 150),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Jogo de Sílabas",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 22,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/letras.png',
                      width: 120,
                    ),
                  ],
                ),
              ),
            ),

            //interacao
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 253, 253, 150),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Exercícios Bucais",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/exerciciosBucais.png',
                      width: 130,
                    ),
                  ],
                ),
              ),
            ),

            //Lazer
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 253, 253, 150),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Rimas e Canções",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/cancoes.png',
                      width: 110,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
