import 'package:flutter/material.dart';
import 'dart:math';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WordsGame(),
    );
  }
}

class WordsGame extends StatefulWidget {
  const WordsGame({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
              title: const Text('Parabéns!'),
              content: const Text('Você leu todos os animais.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
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
        title: const Text('Jogo de Leitura de Animais para Crianças'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Leia o animal:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Image.asset(animalImages[currentAnimal]!,
                height: 150, width: 150, fit: BoxFit.fill),
            const SizedBox(height: 20),
            Text(
              scrambledAnimal,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: textController,
              onChanged: (text) {
                setState(() {
                  isCorrect = false;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Digite o animal',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                checkAnimal();
              },
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 20),
            isCorrect
                ? const Text(
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
