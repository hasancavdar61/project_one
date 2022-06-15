import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/services/services.dart';

class HomeRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController email = TextEditingController();

  void fetchForgot() {
    service.forgotPassword(email: email.text).then((value) {
      if (value != null && value.status == true) {
        debugPrint(value.message);
        Get.snackbar(
          'Bağlantı Gönderimi Başarılı',
          value.message.toString(),
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
        Get.offAllNamed('/GirisSayfasi');
      } else {
        Get.snackbar(
          'Bağlantı Gönderimi Başarısız',
          value!.message!,
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
      }
    });
  }
}
