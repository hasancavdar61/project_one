import 'package:flutter/material.dart';

class IletisimWidget extends StatefulWidget {
  const IletisimWidget({Key? key}) : super(key: key);

  @override
  State<IletisimWidget> createState() => _IletisimWidgetState();
}

class _IletisimWidgetState extends State<IletisimWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'İletişim',
        style: TextStyle(
            color: Colors.grey, fontSize: 40.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
