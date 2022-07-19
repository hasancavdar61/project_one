import 'package:flutter/material.dart';
import 'package:tidi_islam/view/giris/giris_widget.dart';

class GirisView extends StatelessWidget {
  const GirisView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            height: 50,
            child: Image.asset(
              'assets/tidislam-logo-3.png',
              fit: BoxFit.contain,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Text(
                '',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: const GirisWidget(),
      ),
    );
  }
}
