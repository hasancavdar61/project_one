import 'package:flutter/material.dart';
import 'package:tidi_islam/view/kayit/kayit_widget.dart';

class KayitView extends StatelessWidget {
  const KayitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: KayitWidget()),
    );
  }
}
