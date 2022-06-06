import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavorilerWidget extends StatelessWidget {
  const FavorilerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return Center(
      child: box.read('id') == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Favori video eklemek için giriş yapmanız gerekmektedir.',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () => Get.toNamed('/GirisSayfasi'),
                  child: const Text('Giriş Yap'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal),
                  ),
                )
              ],
            )
          : const Text(
              'Favoriler',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
    );
  }
}




          /*
          SingleChildScrollView(
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
              content: const Text('data'),
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
          */