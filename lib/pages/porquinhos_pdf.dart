import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PorquinhosPdf extends StatefulWidget {
  const PorquinhosPdf({super.key});

  @override
  State<PorquinhosPdf> createState() => _PorquinhosPdfState();
}

class _PorquinhosPdfState extends State<PorquinhosPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Os Três Porquinhos"),
        ),
        body:
            // link fron internet
            SfPdfViewer.asset(
          "lib/assets/pdf/porquinhos.pdf",
        )
        // SfPdfViewer.asset("asset/proposal.pdf"),
        );
  }
}
