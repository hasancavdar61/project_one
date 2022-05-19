import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tidi_islam/services/login_service.dart';

class LoginRiverpod extends ChangeNotifier {
  final service = LoginService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final box = GetStorage();

  void fetch() {
    service.loginCall(email: email.text, password: password.text).then((value) {
      if (value != null && value.status == true) {
        box.write("id", value.detail!.id);

        debugPrint("ID kaydedildi ==> ${box.read(
          'id',
        )}");
        Get.snackbar(
          'Hoşgeldiniz',
          value.detail!.email.toString(),
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
        Get.offAllNamed('/');
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
