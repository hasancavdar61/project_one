import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavorilerWidget extends StatelessWidget {
  const FavorilerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Favori Video Yok',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed("/KayitSayfasi"),
            child: Text('Kayıt Formu UI Test Butonu'),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed("/KategoriSayfasi"),
            child: Text('Kategori UI Test Butonu'),
          ),
          ElevatedButton(
            onPressed: () => Get.toNamed("/ProfilSayfasi"),
            child: Text('Profil Formu UI Test Butonu'),
          ),
        ]),
      ),
    );
  }
}
