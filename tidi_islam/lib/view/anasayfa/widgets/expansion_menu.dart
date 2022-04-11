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
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      children: [
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
      ],
    );
  }
}
