import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/services/video_oynatici.dart';

class FavorilerWidget extends ConsumerStatefulWidget {
  const FavorilerWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<FavorilerWidget> createState() => _FavorilerWidgetState();
}

class _FavorilerWidgetState extends ConsumerState<FavorilerWidget> {
  @override
  void initState() {
    ref.read(homeRiverpod).fetchFavoritelist() ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeRiverpod);
    return state.data!.isEmpty
        ? const Center(
            child: Text(
              'Henüz favori eklemediniz',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )
        : ListView.builder(
            itemBuilder: ((context, index) {
              return VideoOynatici(
                embedCode: state.data?[index].embed,
                topTitle: state.data?[index].title,
                bottomTitle: state.data?[index].description,
                imageUrl: state.data?[index].image,
              );
            }),
            itemCount: state.data?.length);
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
}
