import 'package:flutter/material.dart';
import 'package:tidi_islam/view/profil/profil_widget.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfilWidget(),
    );
  }
}
