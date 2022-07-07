import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/services/services.dart';

class SoruCevapRiverpod extends ChangeNotifier {
  final service = Service();

  String? name;
  String? surname;
  String? telephone;
  String? email;
  TextEditingController konu = TextEditingController();
  TextEditingController aciklama = TextEditingController();
  String? videoname;

  void fetchSoruCevap() async {
    await service
        .soruCevapCall(
            name: name!,
            surname: surname!,
            telephone: telephone!,
            email: email!,
            konu: konu.text,
            aciklama: aciklama.text,
            videoname: videoname!)
        .then((value) {
      if (value != null && value.status == true) {
        Get.snackbar(
          'Sorunuz gönderildi.',
          value.message!.toString(),
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Hata Oluştu',
          value!.message.toString(),
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
      }
    });
  }
}
