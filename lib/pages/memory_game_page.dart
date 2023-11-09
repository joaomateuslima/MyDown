import 'package:flutter/material.dart';
import 'dart:async';

class MemoryGame extends StatelessWidget {
  const MemoryGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo da Memória',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MemoryGamePage(),
    );
  }
}

class MemoryGamePage extends StatefulWidget {
  const MemoryGamePage({Key? key}) : super(key: key);

  @override
  MemoryGamePageState createState() => MemoryGamePageState();
}

class MemoryGamePageState extends State<MemoryGamePage> {
  List<String> items = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
  ];

  List<bool> itemStates = List.filled(16, true);
  List<int> selectedItems = [];

  int score = 0;
  int tries = 0;

  Timer? _timer;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    items.shuffle();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void _resetGame() {
    setState(() {
      items.shuffle();
      itemStates = List.filled(16, true);
      selectedItems.clear();
      score = 0;
      tries = 0;
      _elapsedSeconds = 0;
      _startTimer();
    });
  }

  void _checkMatch() {
    if (selectedItems.length == 2) {
      if (items[selectedItems[0]] == items[selectedItems[1]]) {
        setState(() {
          itemStates[selectedItems[0]] = false;
          itemStates[selectedItems[1]] = false;
          selectedItems.clear();
          score++;
          if (score == 8) {
            _timer?.cancel();
            _showGameEndDialog();
          }
        });
      } else {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            itemStates[selectedItems[0]] = true;
            itemStates[selectedItems[1]] = true;
            selectedItems.clear();
          });
        });
      }
      tries++;
    }
  }

  void _showGameEndDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Parabéns!'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Tempo: $_elapsedSeconds segundos'),
              Text('Tentativas: $tries'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
              child: const Text('Jogar Novamente'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Memória'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Tempo: $_elapsedSeconds segundos',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Tentativas: $tries',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  if (itemStates[index]) {
                    setState(() {
                      selectedItems.add(index);
                      itemStates[index] = false;
                      _checkMatch();
                    });
                  }
                },
                child: Card(
                  color: itemStates[index] ? Colors.blue : Colors.grey,
                  child: Center(
                    child: Text(
                      itemStates[index] ? '?' : items[index],
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
