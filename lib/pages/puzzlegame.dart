import 'package:flutter/material.dart';

class PuzzleGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quebra-Cabeças'),
        ),
        body: SingleChildScrollView(
          child: PuzzleGrid(),
        ),
      ),
    );
  }
}

class PuzzleGrid extends StatefulWidget {
  @override
  _PuzzleGridState createState() => _PuzzleGridState();
}

class _PuzzleGridState extends State<PuzzleGrid> {
  List<String> pieceImages = [
    'lib/assets/images/cabeca.jpg',
    'lib/assets/images/rabo.jpg',
    'lib/assets/images/focinho.jpg',
    'lib/assets/images/perna.jpg',
  ];

  List<int> pieces = [0, 1, 2, 3]; // Peças na ordem correta
  final int gridSize = 2;

  @override
  void initState() {
    super.initState();
    shufflePuzzle();
  }

  void shufflePuzzle() {
    setState(() {
      pieces.shuffle();
    });
  }

  bool isSolved() {
    return List.generate(pieces.length, (index) => pieces[index]).toString() ==
        List.generate(pieces.length, (index) => index).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridSize,
            ),
            itemCount: pieces.length,
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // Impede a rolagem da grade
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (!isSolved() && pieces[index] != pieces.length - 1) {
                    setState(() {
                      final emptyIndex = pieces.indexOf(pieces.length - 1);
                      final selectedPiece = pieces[index];
                      pieces[index] = pieces[emptyIndex];
                      pieces[emptyIndex] = selectedPiece;
                    });

                    if (isSolved()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Parabéns!'),
                            content: Text('Você resolveu o quebra-cabeça.'),
                            actions: [
                              TextButton(
                                child: Text('Jogar Novamente'),
                                onPressed: () {
                                  shufflePuzzle();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(pieceImages[pieces[index]]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: isSolved() ? null : shufflePuzzle,
            child: Text('Embaralhar'),
          ),
        ],
      ),
    );
  }
}
