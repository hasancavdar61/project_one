import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavorilerWidget extends StatelessWidget {
  const FavorilerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ]),
      ),
    );
  }
}
