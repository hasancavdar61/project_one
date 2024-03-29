import 'package:flutter/material.dart';
import 'package:tidi_islam/view/anasayfa/anasayfa_widget.dart';
import 'package:tidi_islam/view/favoriler/favoriler_view.dart';
import 'package:tidi_islam/view/iletisim/iletisim_view.dart';
import 'package:tidi_islam/view/info/info_view.dart';
import 'package:tidi_islam/view/soru_cevap/soru_cevap_view.dart';

/// [AnasayfaView]'da kullanılan [BottomNavigationBar] için gerekli ekranlar,
/// burada [ScreenList] classında [List] olarak tutulmaktadır.

class ScreenList {
  List<Widget> screens = [
    //1
    const AnasayfaWidget(),
    //2
    const InfoView(),
    //3
    const FavorilerView(),
    //4
    const SoruCevapView(),
    //5
    const IletisimView(),
  ];
}
