import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FoodGame(),
  ));
}

class FoodGame extends StatefulWidget {
  const FoodGame({Key? key}) : super(key: key);

  @override
  _FoodGameState createState() => _FoodGameState();
}

class _FoodGameState extends State<FoodGame> {
  List<ItemModel> items = [];
  List<ItemModel> items2 = [];

  @override
  void initState() {
    super.initState();
    initGame();
  }

  void initGame() {
    items = [
      ItemModel(
          imagePath: 'lib/assets/images/tomate.png',
          name: "Tomate",
          color: Colors.red),
      ItemModel(
          imagePath: 'lib/assets/images/agua.png',
          name: "Água",
          color: Colors.blue),
      ItemModel(
          imagePath: 'lib/assets/images/cenoura.png',
          name: "Cenoura",
          color: Colors.orange),
      ItemModel(
          imagePath: 'lib/assets/images/batata.png',
          name: "Batata",
          color: Colors.yellow),
      ItemModel(
          imagePath: 'lib/assets/images/alface.png',
          name: "Alface",
          color: Colors.green),
      ItemModel(
          imagePath: 'lib/assets/images/beterraba.png',
          name: "Beterraba",
          color: Colors.purple),
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  void showCongratulationsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Parabéns!'),
          content: const Text('Você concluiu o jogo!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    setState(() {
      initGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arraste as comidinhas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: items.map((item) {
                return Draggable<ItemModel>(
                  data: item,
                  childWhenDragging: Image.asset(item.imagePath,
                      color: Colors.grey, height: 50, width: 50),
                  feedback: Image.asset(item.imagePath,
                      color: item.color, height: 50, width: 50),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      item.imagePath,
                      color: item.color,
                      height: 60,
                      width: 60,
                    ),
                  ),
                );
              }).toList(),
            ),
            const Spacer(),
            Column(
              children: items2.map((item) {
                return DragTarget<ItemModel>(
                  onAccept: (receivedItem) {
                    if (item.name == receivedItem.name) {
                      setState(() {
                        items.remove(receivedItem);
                        items2.remove(item);

                        if (items.isEmpty && items2.isEmpty) {
                          showCongratulationsPopup(context);
                        }
                      });
                    }
                  },
                  onWillAccept: (receivedItem) => true,
                  builder: (context, acceptedItems, rejectedItems) {
                    if (acceptedItems.isNotEmpty) {
                      return Container(
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        color: item.color,
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        color: item.color,
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      );
                    }
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemModel {
  final String name;
  final String imagePath;
  final Color color;

  ItemModel({required this.imagePath, required this.name, required this.color});
}
