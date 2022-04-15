import 'package:flutter/material.dart';
import 'package:tidi_islam/view/soru_cevap/soru_cevap_widget.dart';

class SoruCevapView extends StatefulWidget {
  const SoruCevapView({Key? key}) : super(key: key);

  @override
  State<SoruCevapView> createState() => _SoruCevapViewState();
}

class _SoruCevapViewState extends State<SoruCevapView> {
  @override
  Widget build(BuildContext context) {
    return SoruCevapWidget();
  }
}
