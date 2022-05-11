/// Bu uygulama [Hasan Çavdar] tarafından yazılmaktadır, yazılan kodlar private
/// şekilde GitHub üzerinde tutulup kesinlikle üçüncü parti kişiler tarafından
/// erişimine izin verilmemektedir. Herhangi bir aksi durum dahilinde kodlara
/// izinsiz erişim yasaktır. Kod sahibi kodlarının izni dışında paylaşılması,
/// kopyalanıp şahsi veya kurumsal projelede kullanılması, izinsiz değişiklik
/// yapılması vb. durumlarda hukuki yollara başvurma hakkını saklı tutar.
/// Proje fikri ve mülkiyeti Daynex Yazılım E-ticaret firmasına aittir.
/// Aynı şekilde uygulamayı yazan kişi proje sahibi firmadan izinsiz şekilde
/// uygulamayı şahsi kar amacı elde etmek için kullanamaz. Kendi projesi gibi
/// sosyal medya vb. platformlarda yayınlayamaz.
//! HASAN ÇAVDAR 08.04.2022

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/constants/theme.dart';
import 'package:tidi_islam/services/local_service.dart';
import 'package:tidi_islam/view/anasayfa/anasayfa_view.dart';

void main() {
  runApp(
    const TidApp(),
  );
}

class TidApp extends StatelessWidget {
  const TidApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: GetRouteService().routesGet,
      home: const Scaffold(
        body: AnasayfaView(),
      ),
      theme: AppTheme().themeData,
    );
  }
}
