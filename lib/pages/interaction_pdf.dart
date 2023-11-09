import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class InteractionPdf extends StatefulWidget {
  const InteractionPdf({super.key});

  @override
  State<InteractionPdf> createState() => _InteractionPdfState();
}

class _InteractionPdfState extends State<InteractionPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Estimulando a Interação"),
        ),
        body:
            // link fron internet
            SfPdfViewer.asset(
          "lib/assets/pdf/guiaInteracao.pdf",
        )
        // SfPdfViewer.asset("asset/proposal.pdf"),
        );
  }
}
