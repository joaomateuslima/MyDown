import 'package:flutter/material.dart';
import 'package:my_down_project/pages/alibaba_pdf.dart';
import 'package:my_down_project/pages/chapeuzinho_pdf.dart';
import 'package:my_down_project/pages/pinoquio_pdf.dart';
import 'package:my_down_project/pages/porquinhos_pdf.dart';

class StoriesApp extends StatefulWidget {
  const StoriesApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StoriesAppState createState() => _StoriesAppState();
}

class _StoriesAppState extends State<StoriesApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 203, 149),
      appBar: AppBar(
        title: const Text("Histórias"),
        backgroundColor: const Color.fromARGB(255, 255, 132, 0),
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: GridView.count(
            crossAxisCount: 1,
            mainAxisSpacing: 50,
            crossAxisSpacing: 2,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AlibabaPdf()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromARGB(255, 255, 223, 189),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Alibabá e os 40 ladrões",
                        style: TextStyle(color: Colors.black, fontSize: 27),
                      ),
                      SizedBox(
                        height: 12,
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
                          builder: (context) => const ChapeuzinhoPdf()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromARGB(255, 255, 223, 189)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Chapéuzinho Vermelho",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      SizedBox(
                        height: 12,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PinoquioPdf()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromARGB(255, 255, 223, 189)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Pinóquio",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      SizedBox(
                        height: 12,
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
                          builder: (context) => const PorquinhosPdf()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromARGB(255, 255, 223, 189)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Os Três Porquinhos",
                        style: TextStyle(color: Colors.black, fontSize: 21),
                      ),
                      SizedBox(
                        height: 12,
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
    );
  }
}
