import 'package:flutter/material.dart';

class FavorilerWidget extends StatelessWidget {
  const FavorilerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Favori Video Yok',
        style: TextStyle(
            color: Colors.grey, fontSize: 40.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
