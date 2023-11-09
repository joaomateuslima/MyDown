import 'package:flutter/material.dart';

void main() {
  runApp(ColoringGameApp());
}

class ColoringGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColoringPage(),
    );
  }
}

class ColoringPage extends StatefulWidget {
  @override
  _ColoringPageState createState() => _ColoringPageState();
}

class _ColoringPageState extends State<ColoringPage> {
  Color _selectedColor = Colors.red;
  final AssetImage _flowerImage = AssetImage(
    'lib/assets/images/Bola.png',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo de Colorir'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: _flowerImage),
            ColorPicker(
              selectedColor: _selectedColor,
              onColorSelected: (color) {
                setState(() {
                  _selectedColor = color;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  final Color selectedColor;
  final Function(Color) onColorSelected;

  ColorPicker({required this.selectedColor, required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildColorRow([
          Colors.red,
          Colors.blue,
          Colors.green,
        ]),
        buildColorRow([
          Colors.yellow,
          Colors.pink,
          Colors.purple,
        ]),
        buildColorRow([
          Color.fromARGB(255, 0, 230, 247),
          Color.fromARGB(255, 152, 138, 228),
          Colors.brown,
        ]),
      ],
    );
  }

  Widget buildColorRow(List<Color> colors) {
    List<Widget> colorButtons = [];
    for (Color color in colors) {
      colorButtons.add(buildColorButton(color));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: colorButtons,
    );
  }

  Widget buildColorButton(Color color) {
    return GestureDetector(
      onTap: () {
        onColorSelected(color);
      },
      child: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: color == selectedColor ? Colors.black : Colors.transparent,
            width: 4.0,
          ),
        ),
      ),
    );
  }
}
