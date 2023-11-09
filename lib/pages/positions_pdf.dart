import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PositionsPdf extends StatefulWidget {
  const PositionsPdf({super.key});

  @override
  State<PositionsPdf> createState() => _PositionsPdfState();
}

class _PositionsPdfState extends State<PositionsPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Posições"),
        ),
        body:
            // link fron internet
            SfPdfViewer.asset(
          "lib/assets/pdf/guiaEstimulacao.pdf",
        )
        // SfPdfViewer.asset("asset/proposal.pdf"),
        );
  }
}
