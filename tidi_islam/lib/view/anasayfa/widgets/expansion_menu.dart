import 'package:flutter/material.dart';

class ExpansionMenu extends StatelessWidget {
  const ExpansionMenu({
    Key? key,
    this.kategoriAdi,
    this.onTapKadin,
    this.onTapErkek,
    this.onTapCocuk,
  }) : super(key: key);

  final String? kategoriAdi;
  final VoidCallback? onTapKadin;
  final VoidCallback? onTapErkek;
  final VoidCallback? onTapCocuk;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        kategoriAdi!,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      children: [
        GestureDetector(
          onTap: onTapKadin,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                color: Colors.white),
            margin: const EdgeInsets.only(right: 15.0, left: 15.0),
            child: const Text(
              'KADIN',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTapErkek,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                color: Colors.white),
            margin: const EdgeInsets.only(right: 15.0, left: 15.0),
            child: const Text(
              'ERKEK',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTapCocuk,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                color: Colors.white),
            margin: const EdgeInsets.only(right: 15.0, left: 15.0),
            child: const Text(
              'ÇOCUK',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
