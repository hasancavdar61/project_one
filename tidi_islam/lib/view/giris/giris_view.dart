import 'package:flutter/material.dart';
import 'package:tidi_islam/view/giris/giris_widget.dart';

class GirisView extends StatelessWidget {
  const GirisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: GirisWidget(),
      ),
    );
  }
}
