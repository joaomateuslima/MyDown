import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Page1State createState() => Page1State();
}

class Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 31, 89, 1.0),
        title: const Text("Consultoria"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PsicoPage()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 196, 228),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 140,
                          height: 160,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 255, 196, 228)),
                                  ),
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  'lib/assets/images/eduarda.jpg',
                                  width: 140,
                                  height: 170,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          top: 20,
                          right: 20,
                          bottom: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Psicóloga",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Isabella Rodrigues Pereira",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "APAE Americana",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FonoPage()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 249, 246, 190),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 140,
                          height: 160,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white),
                                  ),
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  'lib/assets/images/maria.jpg',
                                  width: 150,
                                  height: 160,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          top: 20,
                          right: 20,
                          bottom: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Fonoaudióloga",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Mariana Oliveira Santos",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "APAE Americana",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PsicomoPage()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 214, 251, 255),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 150,
                          height: 160,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white),
                                  ),
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  'lib/assets/images/dranaomi.jpg',
                                  width: 150,
                                  height: 160,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Positioned(
                          top: 20,
                          right: 20,
                          bottom: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Psicomotricista ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Ana Clara da Silva",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "APAE Americana",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FonoPage extends StatelessWidget {
  const FonoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 31, 89, 1.0),
        title: const Text('Fonoaudióloga'),
      ),
      body: const Center(
        child: Text(
          'Fonoaudióloga',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class PsicomoPage extends StatelessWidget {
  const PsicomoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 31, 89, 1.0),
        title: const Text('Psicomotricista'),
      ),
      body: const Center(
        child: Text(
          'Psicomotricista',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class PsicoPage extends StatelessWidget {
  const PsicoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 31, 89, 1.0),
        title: const Text('Psicóloga'),
      ),
      body: const Center(
        child: Text(
          'Psicóloga',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
