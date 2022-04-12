import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hakkımızda',
        style: TextStyle(
            color: Colors.grey, fontSize: 40.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
