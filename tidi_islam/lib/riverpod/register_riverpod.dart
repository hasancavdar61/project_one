import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tidi_islam/services/services.dart';

//! Kullanıcı kayıt işlemi

class RegisterRiverpod extends ChangeNotifier {
  final service = Service();
  String cities = '';

  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController tel = TextEditingController();
  String? city;
  String? district;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController paswordconf = TextEditingController();

  void fetchRegister() async {
    await service
        .registerCall(
            name: name.text,
            surname: surname.text,
            tel: tel.text,
            city: city!,
            district: district!,
            email: email.text,
            password: password.text,
            passwordconf: paswordconf.text)
        .then((value) {
      if (value != null && value.status == true) {
        GetStorage().write("id", value.userId);
        Get.snackbar(
          'Kaydınız oluşturuldu.',
          value.message!.toString(),
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
