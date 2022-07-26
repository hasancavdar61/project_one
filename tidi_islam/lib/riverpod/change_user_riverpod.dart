import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/services/services.dart';

//! Kullanıcı bilgileri güncelleme işlemleri.

class ChangeUserRiverpod extends ChangeNotifier {
  String? controllerEmail;
  String? controllerFirstName;
  String? controllerLastName;
  String? controllerTelephone;
  final service = Service();
  TextEditingController email = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController telephone = TextEditingController();
  void changeUser() {
    service
        .userChange(
            email: email.text,
            firstname: firstname.text,
            lastname: lastname.text,
            telephone: telephone.text)
        .then((value) {
      if (value.status == true) {
        Get.snackbar(
          'Güncelleme Başarılı',
          value.message!,
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Güncelleme Başarısız',
          value.message!,
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
      }
    });
  }
}
