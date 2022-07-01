import 'package:flutter/material.dart';
import 'package:tidi_islam/view/kayit/kayit_widget.dart';

class KayitView extends StatelessWidget {
  const KayitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          alignment: Alignment.center,
          height: 50,
          child: Image.asset(
            'assets/tid_logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: SafeArea(child: KayitWidget()),
    );
  }
}
