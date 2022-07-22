import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tidi_islam/view/anasayfa/anasayfa_view.dart';
import 'package:tidi_islam/view/giris/giris_view.dart';
import 'package:tidi_islam/view/giris/widgets/forgot_password.dart';
import 'package:tidi_islam/view/kategoriler/kategori_view.dart';
import 'package:tidi_islam/view/kayit/kayit_view.dart';
import 'package:tidi_islam/view/profil/profil_view.dart';
import 'package:tidi_islam/view/profil/widgets/changepass_widget.dart';
import 'package:tidi_islam/view/search/search_widget.dart';
import 'package:tidi_islam/view/sifre_degistirme/sifre_degistirme_view.dart';
import 'package:tidi_islam/view/user_detail/change_user_detail_view.dart';

///[GetX] named route [GetRouteService] with [gettingRoutes] method.
class GetRouteService {
  get routesGet => [
        gettingRoutes('/', const AnasayfaView()),
        gettingRoutes('/KategoriSayfasi', const KategoriView()),
        gettingRoutes('/KayitSayfasi', const KayitView()),
        gettingRoutes('/GirisSayfasi', const GirisView()),
        gettingRoutes('/ProfilSayfasi', const ProfilView()),
        gettingRoutes('/SifreDegistirmeSayfasi', const SifreDegistirmeView()),
        gettingRoutes('/ForgotPassword', const ForgotPassword()),
        gettingRoutes('/ChangePassword', const ChangePassword()),
        gettingRoutes('/ChangeUserDetail', const ChangeUserView()),
        gettingRoutes('/SearchPage', const SearchWidget()),
        // gettingRoutes('/test', const TestApp()),
      ];
}

/// self create [gettingRoutes] method.
GetPage<dynamic> gettingRoutes(String name, Widget pageGetter) => GetPage(
      name: name,
      page: () => pageGetter,
      //transition: transition,
    );
