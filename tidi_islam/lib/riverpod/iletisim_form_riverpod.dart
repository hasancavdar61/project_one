import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/services/services.dart';

//! İletişim formu gönderme işlemi

class IletisimFormRiverpod extends ChangeNotifier {
  final service = Service();

  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController message = TextEditingController();

  void fetchIletisimForm() async {
    await service
        .iletisimFormCall(
            fullname: fullname.text,
            email: email.text,
            telefon: telefon.text,
            subject: subject.text,
            message: message.text)
        .then((value) {
      if (value != null && value.status == true) {
        Get.snackbar(
          'İletişim talebi gönderildi.',
          value.message!.toString(),
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
        fullname.clear();
        email.clear();
        telefon.clear();
        subject.clear();
        message.clear();
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
