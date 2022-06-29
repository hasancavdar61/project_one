import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/services/services.dart';

class RegisterRiverpod extends ChangeNotifier {
  final service = Service();
  String cities = '';

  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController paswordconf = TextEditingController();

  void fetchRegister() async {
    await service
        .registerCall(
            name: name.text,
            surname: surname.text,
            tel: tel.text,
            city: city.text,
            district: district.text,
            email: email.text,
            password: password.text,
            passwordconf: paswordconf.text)
        .then((value) {
      if (value != null && value.status == true) {
        Get.snackbar(
          'Kaydınız oluşturuldu.',
          value.message!.toString(),
          backgroundColor: Colors.teal,
          colorText: Colors.white,
        );
        Get.offAndToNamed('/GirisSayfasi');
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
