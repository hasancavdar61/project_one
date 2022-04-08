import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:tidi_islam/view/anasayfa/anasayfa_view.dart';
import 'package:tidi_islam/view/kategoriler/kategori_view.dart';

///[GetX] named route [GetRouteService] with [gettingRoutes] method.
class GetRouteService {
  get routesGet => [
        gettingRoutes('/', const AnasayfaView()),
        gettingRoutes('/KategoriSayfasi', const KategoriView()),
      ];
}

/// self create [gettingRoutes] method.
GetPage<dynamic> gettingRoutes(String name, Widget pageGetter) => GetPage(
      name: name,
      page: () => pageGetter,
    );
