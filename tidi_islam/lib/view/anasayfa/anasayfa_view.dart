import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/view/anasayfa/anasayfa_widget.dart';
import 'package:tidi_islam/view/anasayfa/widgets/yan_menu_widget.dart';
import 'package:tidi_islam/view/favoriler/favoriler_view.dart';
import 'package:tidi_islam/view/iletisim/iletisim_view.dart';
import 'package:tidi_islam/view/soru_cevap/soru_cevap_view.dart';

class AnasayfaView extends StatefulWidget {
  const AnasayfaView({Key? key}) : super(key: key);

  @override
  State<AnasayfaView> createState() => _AnasayfaViewState();
}

class _AnasayfaViewState extends State<AnasayfaView> {
  int currentIndex = 0;
  List<Widget> screens = [
    //1
    const AnasayfaWidget(),
    //2
    const FavorilerView(),
    //3
    const SoruCevapView(),
    //4
    const IletisimView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('TİDİSLAM'),
          actions: [
            TextButton(
              onPressed: () => Get.toNamed('/KategoriSayfasi'),
              child: const Text(
                'Giriş Yap',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        /// [Drawer] yapısı [YanMenu] adında toplanmış atomic yapı sağlanmıştır.
        // ? Dinamikleştirme gerekebilir.
        drawer: const YanMenu(),

        /// [BottomNavigationBar] onTap metodu [currentIndex] durumuna bağlıdır.
        //! [setState] metodu değişecektir state management ile yapılacaktır.
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.teal,
          items: const [
            BottomNavigationBarItem(
              label: 'Anasayfa',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Favoriler',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Soru-Cevap',
              icon: Icon(Icons.question_mark),
            ),
            BottomNavigationBarItem(
              label: 'İletişim',
              icon: Icon(Icons.mail),
            ),
          ],
        ),

        /// [Scaffold] yapısının [body] parametresi burada bulunur.
        /// Sayfa görüntülenmeleri [AnasayfaView] içerisinde bulunan,
        /// [BottomNavigationBar] tarafından kontrol edilmektedir. Bu kontroller
        /// [onTap] metoduyla set edilip kullanıcının [BottomNavigationBar]
        /// üzerindeki butonlara dokunma/tıklamasıyla tetiklenir ve gerekli
        /// sayfa ekrana gelir.

        body: screens[currentIndex]);
  }
}
