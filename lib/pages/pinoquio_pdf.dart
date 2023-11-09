import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PinoquioPdf extends StatefulWidget {
  const PinoquioPdf({super.key});

  @override
  State<PinoquioPdf> createState() => _PinoquioPdfState();
}

class _PinoquioPdfState extends State<PinoquioPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Pinóquio"),
        ),
        body:
            // link fron internet
            SfPdfViewer.asset(
          "lib/assets/pdf/Pinoquio.pdf",
        )
        // SfPdfViewer.asset("asset/proposal.pdf"),
        );
  }
}
