import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WordSearch(),
    );
  }
}

class WordSearch extends StatefulWidget {
  @override
  _WordSearchState createState() => _WordSearchState();
}

class _WordSearchState extends State<WordSearch> {
  final List<String> words = ['AMOR', 'PERFEITO', 'SINDROME', 'AUTOACEITACAO'];

  final List<List<String>> grid = [
    ['A', 'P', 'M', 'E', 'Z', 'A', 'T', 'Q', 'R', 'W'],
    ['S', 'N', 'D', 'R', 'O', 'M', 'E', 'P', 'L', 'I'],
    ['Q', 'K', 'O', 'T', 'R', 'A', 'U', 'T', 'O', 'A'],
    ['F', 'C', 'A', 'C', 'E', 'I', 'T', 'A', 'S', 'V'],
    ['B', 'Y', 'D', 'D', 'E', 'A', 'A', 'O', 'N', 'O'],
    ['A', 'P', 'S', 'V', 'B', 'D', 'D', 'F', 'N', 'O'],
    ['W', 'G', 'F', 'I', 'M', 'V', 'R', 'R', 'N', 'K'],
  ];

  List<String> foundWords = [];
  List<List<bool>> selectedLetters = List.generate(
    7,
    (row) => List.generate(10, (col) => false),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caça-Palavras'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < grid.length; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int j = 0; j < grid[i].length; j++)
                    GestureDetector(
                      onTap: () {
                        if (!foundWords.contains(grid[i][j])) {
                          selectLetter(i, j);
                        }
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          color: selectedLetters[i][j] ? Colors.green : null,
                        ),
                        child: Text(
                          grid[i][j],
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                ],
              ),
            SizedBox(height: 20),
            Text(
              'Palavras para encontrar:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              children: words
                  .map(
                    (word) => Chip(
                      label: Text(word),
                      backgroundColor: foundWords.contains(word)
                          ? Colors.green
                          : Colors.blue,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  void selectLetter(int row, int col) {
    if (foundWords.isNotEmpty) return;

    selectedLetters[row][col] = !selectedLetters[row][col];

    final selectedWord = getSelectedWord(row, col);

    if (selectedWord != null && words.contains(selectedWord)) {
      foundWords.add(selectedWord);
      clearSelectedLetters();
    }

    setState(() {});
  }

  String? getSelectedWord(int row, int col) {
    String word = grid[row][col];
    if (col < grid[row].length - 1) {
      for (int i = col + 1; i < grid[row].length; i++) {
        word += grid[row][i];
        if (word.length > 10) break;
      }
    }
    return word;
  }

  void clearSelectedLetters() {
    for (int i = 0; i < selectedLetters.length; i++) {
      for (int j = 0; j < selectedLetters[i].length; j++) {
        selectedLetters[i][j] = false;
      }
    }
  }
}
