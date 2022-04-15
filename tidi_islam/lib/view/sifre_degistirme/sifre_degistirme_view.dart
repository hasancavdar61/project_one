import 'package:flutter/material.dart';
import 'package:tidi_islam/view/sifre_degistirme/sifre_degistirme_widget.dart';

class SifreDegistirmeView extends StatelessWidget {
  const SifreDegistirmeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SifreDegistirmeWidget(),
    );
  }
}
