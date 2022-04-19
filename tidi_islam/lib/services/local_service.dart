import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:tidi_islam/view/anasayfa/anasayfa_view.dart';
import 'package:tidi_islam/view/giris/giris_view.dart';
import 'package:tidi_islam/view/kategoriler/kategori_view.dart';
import 'package:tidi_islam/view/kayit/kayit_view.dart';
import 'package:tidi_islam/view/profil/profil_view.dart';
import 'package:tidi_islam/view/sifre_degistirme/sifre_degistirme_view.dart';

///[GetX] named route [GetRouteService] with [gettingRoutes] method.
class GetRouteService {
  get routesGet => [
        gettingRoutes('/',  const AnasayfaView()),
        gettingRoutes('/KategoriSayfasi', const KategoriView()),
        gettingRoutes('/KayitSayfasi', const KayitView()),
        gettingRoutes('/GirisSayfasi', const GirisView()),
        gettingRoutes('/ProfilSayfasi', const ProfilView()),
        gettingRoutes('/SifreDegistirmeSayfasi', const SifreDegistirmeView()),
      ];
}

/// self create [gettingRoutes] method.
GetPage<dynamic> gettingRoutes(String name, Widget pageGetter) => GetPage(
      name: name,
      page: () => pageGetter,
      //transition: transition,
    );
