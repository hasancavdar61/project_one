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
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.05),
                Colors.black.withOpacity(0.35)
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
              Container(
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade400)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(14.0),
                width: double.infinity,
                child: const Text('KADIN'),
              ),
              Container(
                decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade400)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(14.0),
                width: double.infinity,
                child: const Text('ERKEK'),
              ),
              Container(
                padding: const EdgeInsets.all(14.0),
                width: double.infinity,
                color: Colors.white,
                child: const Text('ÇOCUK'),
              ),
            ],
          ),
        )
      ],
    );
  }
}


/*
 /// Kadın isimli alt kategori butonu
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

         /// Erkek isimli alt kategori butonu
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

         /// Çocuk isimli alt kategori butonu
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
*/