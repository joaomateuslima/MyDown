import 'package:flutter/material.dart';
import 'package:my_down_project/pages/alibaba_pdf.dart';
import 'package:my_down_project/pages/chapeuzinho_pdf.dart';
import 'package:my_down_project/pages/pinoquio_pdf.dart';
import 'package:my_down_project/pages/porquinhos_pdf.dart';

class StoriesApp extends StatefulWidget {
  const StoriesApp({Key? key}) : super(key: key);

  @override
  _StoriesAppState createState() => _StoriesAppState();
}

class _StoriesAppState extends State<StoriesApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 203, 149),
      appBar: AppBar(
        title: Text("Histórias"),
        backgroundColor: Color.fromARGB(255, 255, 132, 0),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 60, crossAxisSpacing: 10),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AlibabaPdf()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromARGB(255, 255, 223, 189),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Alibaba",
                          style: TextStyle(color: Colors.black, fontSize: 35),
                        ),
                        Image.asset(
                          'lib/assets/images/alibaba.png',
                          width: 190,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChapeuzinhoPdf()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color.fromARGB(255, 255, 223, 189)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Chapéuzinho Vermelho",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Image.asset(
                          'lib/assets/images/chapeuzinho.png',
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PinoquioPdf()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color.fromARGB(255, 255, 223, 189)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pinóquio",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        Image.asset(
                          'lib/assets/images/pinoquio.png',
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PorquinhosPdf()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color.fromARGB(255, 255, 223, 189)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Os Três Porquinhos",
                          style: TextStyle(color: Colors.black, fontSize: 21),
                        ),
                        Image.asset(
                          'lib/assets/images/porquinhos.png',
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
