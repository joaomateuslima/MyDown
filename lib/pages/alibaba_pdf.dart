import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AlibabaPdf extends StatefulWidget {
  const AlibabaPdf({super.key});

  @override
  State<AlibabaPdf> createState() => _AlibabaPdfState();
}

class _AlibabaPdfState extends State<AlibabaPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Alibabá e os 40 ladrões"),
        ),
        body:
            // link fron internet
            SfPdfViewer.asset(
          "lib/assets/pdf/alibaba.pdf",
        )
        // SfPdfViewer.asset("asset/proposal.pdf"),
        );
  }
}
