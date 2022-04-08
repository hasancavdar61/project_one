import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/view/anasayfa/anasayfa_widget.dart';
import 'package:tidi_islam/view/anasayfa/widgets/alt_menu_widget.dart';
import 'package:tidi_islam/view/anasayfa/widgets/yan_menu_widget.dart';

class AnasayfaView extends StatefulWidget {
  const AnasayfaView({Key? key}) : super(key: key);

  @override
  State<AnasayfaView> createState() => _AnasayfaViewState();
}

class _AnasayfaViewState extends State<AnasayfaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('TİDİSLAM'),
          actions: [
            TextButton(
              onPressed: () => Get.toNamed('/KategoriSayfasi') ,
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

        /// Bütün alt menüler [AltMenu] ile atomic yapıya alınmıştır.
        //? Dinamik yapılar eklenebilir.
        bottomNavigationBar: const AltMenu(),

        /// [Scaffold] yapısının [body] parametresi burada bulunur.
        /// Sayfada görünecek bütün viewlar [AnasayfaWidget] altında toplanmıştır.

        body: const AnasayfaWidget());
  }
}
