import 'package:flutter/material.dart';
import 'dart:math';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WordsGame(),
    );
  }
}

class WordsGame extends StatefulWidget {
  @override
  _WordsGameState createState() => _WordsGameState();
}

class _WordsGameState extends State<WordsGame> {
  List<String> animals = [
    'cachorro',
    'pato',
    'borboleta',
    'gato',
    'macaco',
    'leão',
    'tigre',
    'gorila',
    'coelho'
  ];
  int currentAnimalIndex = 0;
  String currentAnimal = '';
  String scrambledAnimal = '';
  TextEditingController textController = TextEditingController();
  bool isCorrect = false;

  Map<String, String> animalImages = {
    'cachorro': 'lib/assets/images/cachorro.png',
    'pato': 'lib/assets/images/pato.png',
    'borboleta': 'lib/assets/images/borboleta.png',
    'gato': 'lib/assets/images/gato.png',
    'macaco': 'lib/assets/images/macaco.png',
    'leão': 'lib/assets/images/leao.png',
    'tigre': 'lib/assets/images/tigre.png',
    'gorila': 'lib/assets/images/gorila.png',
    'coelho': 'lib/assets/images/coelho.png',
  };

  @override
  void initState() {
    super.initState();
    setCurrentAnimal();
  }

  void setCurrentAnimal() {
    setState(() {
      currentAnimal = animals[currentAnimalIndex];
      scrambledAnimal = scrambleAnimal(currentAnimal);
      textController.text = '';
      isCorrect = false;
    });
  }

  String scrambleAnimal(String animal) {
    List<String> characters = animal.split('');
    characters.shuffle(Random());
    return characters.join();
  }

  void checkAnimal() {
    final enteredAnimal = textController.text.trim();
    final correctAnimal = currentAnimal;

    setState(() {
      isCorrect = enteredAnimal.toLowerCase() == correctAnimal.toLowerCase();
    });

    if (isCorrect) {
      if (currentAnimalIndex < animals.length - 1) {
        currentAnimalIndex++;
        setCurrentAnimal();
      } else {
        // Todos os animais foram lidos
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Parabéns!'),
              content: Text('Você leu todos os animais.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo de Leitura de Animais para Crianças'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Leia o animal:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Image.asset(animalImages[currentAnimal]!,
                height: 150, width: 150, fit: BoxFit.fill),
            SizedBox(height: 20),
            Text(
              scrambledAnimal,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: textController,
              onChanged: (text) {
                setState(() {
                  isCorrect = false;
                });
              },
              decoration: InputDecoration(
                hintText: 'Digite o animal',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                checkAnimal();
              },
              child: Text('Verificar'),
            ),
            SizedBox(height: 20),
            isCorrect
                ? Text(
                    'Correto!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
