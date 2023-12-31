import 'package:flutter/material.dart';
import 'package:my_down_project/pages/food_game.dart';

import 'package:my_down_project/pages/home_page.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  FoodPageState createState() => FoodPageState();
}

class FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 31, 89, 1.0),
        title: const Text(
          "Alimentação",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 213, 251, 254),
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
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 185, 234, 239),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Pratos",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/comida4.png',
                      width: 120,
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
                  color: const Color.fromARGB(255, 185, 234, 239),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Cardápio",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/comida5.png',
                      width: 120,
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
                  MaterialPageRoute(builder: (context) => const FoodGame()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 185, 234, 239),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Arraste as Comidinhas",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/comida3.png',
                      width: 127,
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
                  color: const Color.fromARGB(255, 185, 234, 239),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Dicas",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/comida2.png',
                      width: 130,
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
                  color: const Color.fromARGB(255, 185, 234, 239),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Mão na massa",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/comida6.png',
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
                  color: const Color.fromARGB(255, 185, 234, 239),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Temperos",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/comida.png',
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
