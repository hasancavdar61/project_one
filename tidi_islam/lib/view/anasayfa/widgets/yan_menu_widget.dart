import 'package:flutter/material.dart';
import 'package:tidi_islam/view/anasayfa/widgets/expansion_menu.dart';

class YanMenu extends StatefulWidget {
  const YanMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<YanMenu> createState() => _YanMenuState();
}

class _YanMenuState extends State<YanMenu> {
  @override
  Widget build(BuildContext context) {
    //! [Drawer] şimdilik static veriler ile dolduruldu veritabanı bağlantısı
    //! yapılcak ve dinamik yapıya kavuşacak.

    return Drawer(
      backgroundColor: Colors.teal,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(14.0),
            color: Colors.teal.shade600,
            child: const Text(
              'MENÜLERİMİZ',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// Custom oluşturulan [ExpansionMenu] [ExpansionTile] özellilkleri
          /// barındırıp custom propertyler alarak kullanımı hafife kolaya
          /// indirilmiştir.
          ExpansionMenu(
            kategoriAdi: 'DİNİ KELİMELER VE ANLAMLARI',
            routeNameKadin: '',
            routeNameErkek: '',
            routeNameCocuk: '',
          ),
          ExpansionMenu(
            kategoriAdi: 'DİNİ BİLGİLER',
            routeNameKadin: '',
            routeNameErkek: '',
            routeNameCocuk: '',
          ),
          ExpansionMenu(
            kategoriAdi: 'HZ. MUHAMMED ',
            routeNameKadin: '',
            routeNameErkek: '',
            routeNameCocuk: '',
          ),
          ExpansionMenu(
            kategoriAdi: 'DİNİ KELİMELER VE ANLAMLARI',
            routeNameKadin: '',
            routeNameErkek: '',
            routeNameCocuk: '',
          ),

          /// Tek dokunma ve açılmayan menü yapısı
        ],
      ),
    );
  }
}

class KategoriListesi {
  List<String> kategoriAdi = [
    "DİNİ KELİMELER VE ANLAMLARI",
    "DİNİ BİLGİLER",
    "HZ. MUHAMMED (S.A.S.)",
    "TİD KUR'AN-I KERİM MEALİ"
  ];
  List<String> altKategoriler = [
    "KADIN",
    "ERKEK",
    "ÇOCUK",
  ];
}

/**
 ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  ExpansionMenu(
                    kategoriAdi: KategoriListesi().kategoriAdi[index],
                    routeName: 'GirisSayfasi',
                  ),
                  const Divider(
                    height: 1.0,
                    thickness: 1.0,
                    endIndent: 20.0,
                    color: Colors.grey,
                  ),
                ],
              );
            }),
            itemCount: KategoriListesi().kategoriAdi.length,
          ),
 */
