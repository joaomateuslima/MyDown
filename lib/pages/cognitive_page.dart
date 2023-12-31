import 'package:flutter/material.dart';
import 'package:my_down_project/pages/home_page.dart';
import 'package:my_down_project/pages/memory_game_page.dart';

class CognitivePage extends StatefulWidget {
  const CognitivePage({Key? key}) : super(key: key);

  @override
  CognitivePageState createState() => CognitivePageState();
}

class CognitivePageState extends State<CognitivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 100, 46, 248),
        title: const Text(
          "Área cognitiva",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 154, 127, 223),
      body: Padding(
        padding: EdgeInsets.zero,
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 50,
          crossAxisSpacing: 5,
          children: [
            //Alimentacao
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MemoryGame()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 186, 156, 255),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Jogo da Memória",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/jogoMemoria.png',
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
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 186, 156, 255),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Caça-Palavras",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/cacaPalavras.png',
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
                  color: const Color.fromARGB(255, 186, 156, 255),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Charadas",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/cognitiva4.png',
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
                  color: const Color.fromARGB(255, 186, 156, 255),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Invenções",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/cognitiva2.png',
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
                  color: const Color.fromARGB(255, 186, 156, 255),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Curiosidades",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/cognitiva3.png',
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
                  color: const Color.fromARGB(255, 186, 156, 255),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Matemática",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/matematica.png',
                      width: 130,
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
