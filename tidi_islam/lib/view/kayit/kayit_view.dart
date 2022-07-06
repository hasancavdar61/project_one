import 'package:flutter/material.dart';
import 'package:tidi_islam/view/kayit/kayit_widget.dart';

class KayitView extends StatelessWidget {
  const KayitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const [
          Text(
            'giris yap',
            style: TextStyle(color: Colors.black),
          )
        ],
        title: Container(
          alignment: Alignment.center,
          height: 50,
          child: Image.asset(
            'assets/tidislam-logo-3.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: SafeArea(child: KayitWidget()),
    );
  }
}
