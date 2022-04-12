import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/view/anasayfa/anasayfa_widget.dart';
import 'package:tidi_islam/view/anasayfa/widgets/yan_menu_widget.dart';
import 'package:tidi_islam/view/favoriler/favoriler_view.dart';
import 'package:tidi_islam/view/iletisim/iletisim_view.dart';
import 'package:tidi_islam/view/info/info_view.dart';
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
    //5
    const InfoView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: GestureDetector(
            onTap: () => setState(() {
              currentIndex = 0;
            }),
            child: const Text('TİDİSLAM'),
          ),
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
          selectedFontSize: 12.0,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.teal,
          items: const [
            BottomNavigationBarItem(
              label: 'Anasayfa',
              icon: FaIcon(
                FontAwesomeIcons.houseChimney,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Favoriler',
              icon: FaIcon(FontAwesomeIcons.heart),
            ),
            BottomNavigationBarItem(
              label: 'Soru-Cevap',
              icon: FaIcon(FontAwesomeIcons.question),
            ),
            BottomNavigationBarItem(
              label: 'İletişim',
              icon: FaIcon(FontAwesomeIcons.commentDots),
            ),
            BottomNavigationBarItem(
              label: 'Hakkımızda',
              icon: FaIcon(FontAwesomeIcons.circleInfo),
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
