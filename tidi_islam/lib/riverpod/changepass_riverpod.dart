import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tidi_islam/services/services.dart';

//! Kullanıcı şifre değiştirme işlemi.

class ChangePassRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController password = TextEditingController();
  TextEditingController passwordconf = TextEditingController();

  void fetchChangePass() {
    service
        .changePassword(
            password: password.text, passwordconf: passwordconf.text)
        .then((value) {
      if (value.status == true) {
        debugPrint(value.message);
        Get.snackbar(
          'Şifre Değiştirme Başarılı',
          value.message.toString(),
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
        GetStorage().remove('cookie');
        GetStorage().remove('id');
        Get.offAllNamed('/GirisSayfasi');
      } else {
        Get.snackbar(
          'Şifre Değiştirme Başarısız',
          value.message!,
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
      }
    });
  }
}
