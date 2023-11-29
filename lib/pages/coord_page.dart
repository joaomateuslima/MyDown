import 'package:flutter/material.dart';
import 'package:my_down_project/pages/home_page.dart';
import 'package:my_down_project/pages/positions_pdf.dart';
import 'package:my_down_project/pages/puzzlegame.dart';

class CoordenationPage extends StatefulWidget {
  const CoordenationPage({Key? key}) : super(key: key);

  @override
  CoordenationPageState createState() => CoordenationPageState();
}

class CoordenationPageState extends State<CoordenationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 71, 170),
        title: const Text(
          "Coordenação Motora",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 124, 198),
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
                  MaterialPageRoute(builder: (context) => const PuzzleGrid()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 255, 170, 216),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Quebra-Cabeça",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 25,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/coordQuebraCabeca.png',
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
                  color: const Color.fromARGB(255, 255, 170, 216),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Bola",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 30,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/coordBola.png',
                      width: 180,
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
                  color: const Color.fromARGB(255, 255, 170, 216),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dança",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 30,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/coordDanca.png',
                      width: 150,
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
                  MaterialPageRoute(builder: (context) => const PositionsPdf()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 255, 170, 216),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Posições",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 30,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/coordPosicoes.png',
                      width: 100,
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
                  color: const Color.fromARGB(255, 255, 170, 216),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Exercícios",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 25,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/exercicios.png',
                      width: 100,
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
                  color: const Color.fromARGB(255, 255, 170, 216),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dicas",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 30,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/coordDicas.png',
                      width: 150,
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
