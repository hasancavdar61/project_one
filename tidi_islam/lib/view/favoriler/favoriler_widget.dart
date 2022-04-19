import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/view/anasayfa/widgets/yan_menu_widget.dart';

class FavorilerWidget extends StatelessWidget {
  const FavorilerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxString text = 'text'.obs;
    return SingleChildScrollView(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Favori Video Yok',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed("/KayitSayfasi"),
            child: const Text('Kayıt Formu UI Test Butonu'),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed("/KategoriSayfasi"),
            child: const Text('Kategori UI Test Butonu'),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed("/ProfilSayfasi"),
            child: const Text('Profil Formu UI Test Butonu'),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed("/SifreDegistirmeSayfasi"),
            child: const Text('Şifre Değiştirme UI Test Butonu'),
          ),
          ElevatedButton(
            onPressed: () => Get.snackbar(KategoriListesi().kategoriAdi[0],
                KategoriListesi().altKategoriler[0],
                colorText: Colors.white, backgroundColor: Colors.red),
            child: const Text('Snackbar UI Test Butonu',
                style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: () => Get.defaultDialog(
              title: 'Dialog Test',
              content: Text('data'),
              actions: [
                ElevatedButton(
                  onPressed: () => text.value = 'dialog',
                  child: Obx(() => Text(text.string)),
                ),
              ],
            ),
            child: const Text('Dialog UI Test Butonu'),
          ),
          ElevatedButton(
            onPressed: () => Get.bottomSheet(
              Container(
                height: 200,
                color: Colors.red,
              ),
            ),
            child: const Text('Şifre Değiştirme UI Test Butonu'),
          ),
        ]),
      ),
    );
  }
}
