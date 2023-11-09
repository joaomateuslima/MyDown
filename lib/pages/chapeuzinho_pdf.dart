import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ChapeuzinhoPdf extends StatefulWidget {
  const ChapeuzinhoPdf({super.key});

  @override
  State<ChapeuzinhoPdf> createState() => _ChapeuzinhoPdfState();
}

class _ChapeuzinhoPdfState extends State<ChapeuzinhoPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Chapéuzinho Vermelho"),
        ),
        body:
            // link fron internet
            SfPdfViewer.asset(
          "lib/assets/pdf/chapeuzinho.pdf",
        )
        // SfPdfViewer.asset("asset/proposal.pdf"),
        );
  }
}
