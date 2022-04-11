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
        padding: const EdgeInsets.only(top: 20.0),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0, left: 20.0, bottom: 20.0),
            child: const Text(
              'MENÜLERİMİZ',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        /// Custom oluşturulan [ExpansionMenu] [ExpansionTile] özellilkleri 
        /// barındırıp custom propertyler alarak kullanımı hafife kolaya 
        /// indirilmiştir.
          const ExpansionMenu(
            kategoriAdi: 'DİNİ KELİMELER VE ANLAMLARI',
          ),
          const ExpansionMenu(
            kategoriAdi: 'DİNİ BİLGİLER',
          ),
          const ExpansionMenu(
            kategoriAdi: 'HZ. MUHAMMED (S.A.S.)',
          ),
          /// Tek dokunma ve açılmayan menü yapısı
          const ListTile(
            title: Text(
              "TİD KUR'AN-I KERİM MEALİ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
