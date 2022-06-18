import 'dart:math';

import 'package:flutter/material.dart';

class ExpansionMenu extends StatelessWidget {
  const ExpansionMenu({
    Key? key,
    this.kategoriAdi,
    this.routeNameKadin,
    this.routeNameErkek,
    this.routeNameCocuk,
    this.otherChild,
  }) : super(key: key);

  final String? kategoriAdi;
  final String? routeNameKadin;
  final String? routeNameErkek;
  final String? routeNameCocuk;
  final Widget? otherChild;

  @override
  Widget build(BuildContext context) {
    ///Açılır menü başlığı [ExpansionTile] bu açılır menü kadın, erkek, çocuk
    ///alt kategorilerine sahip ve dokunma etkileşimi bu alt kategorilerin
    ///[GestureDetector] ile sarmalanmasından sonra yine [GestureDetector]
    ///özelliği olan [onTap] metoduyla sağlanıyor.

    return ExpansionTile(
      title: Text(
        kategoriAdi!,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      ),
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              transform: const GradientRotation(pi / 90),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.grey.withOpacity(0.0),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 8,
                blurRadius: 10,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                color: Colors.black87,
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'ALT MENÜ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 18.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(child: Expanded(child: otherChild!))
            ],
          ),
        )
      ],
    );
  }
}
