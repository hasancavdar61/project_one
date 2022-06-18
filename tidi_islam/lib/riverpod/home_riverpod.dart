import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/model/favorite_model.dart';
import 'package:tidi_islam/model/menu_model.dart';
import 'package:tidi_islam/model/slider_model.dart';
import 'package:tidi_islam/services/services.dart';

class HomeRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController email = TextEditingController();
  String page = '0';
  String perPage = '12';
  List<Video>? data = [];
  List<Sliders>? dataSlider = [];
  List<Menu>? dataModel = [];

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

  void fetchFavoritelist() {
    service.favoriteListCall(page: page, perPage: perPage).then((value) {
      if (value != null) {
        data = value.videos;
      } else {
        throw ('Bir sorun oluştu');
      }
    });
  }

  void fetchSlider() {
    service.sliderCall().then((value) {
      if (value != null) {
        dataSlider = value.slider;
      } else {
        throw ('Bir sorun oluştu');
      }
    });
  }

  void fetchMenu() {
    service.menuCall().then((value) {
      if (value != null) {
        debugPrint(value.toString());
        dataModel = value.menus;
      } else {
        throw ('Bir sorun oluştu');
      }
    });
  }
}
