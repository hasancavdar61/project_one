import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/model/category_model.dart';
import 'package:tidi_islam/model/favorite_model.dart';
import 'package:tidi_islam/model/menu_model.dart';
import 'package:tidi_islam/model/search_model.dart';
import 'package:tidi_islam/model/slider_model.dart';
import 'package:tidi_islam/services/services.dart';

//! Anasayfa işlemleri

class HomeRiverpod extends ChangeNotifier {
  final service = Service();
  TextEditingController email = TextEditingController();
  String page = '0';
  String? id;
  String perPage = '12';
  List<Video>? data = [];
  List<Sliders>? dataSlider = [];
  List<Menu>? dataModel = [];
  String slug = '';
  List<Videox>? dataCatVideo = [];
  List<Videox>? dataId = [];
  String path = '';

  List<Product>? searchVideoData = [];
  TextEditingController search = TextEditingController();

  List videoPath = [];

//! Şifremi unuttum, bağlantı gönderme metodu.

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

//! Favori listeleme metodu

  void fetchFavoritelist() {
    service.favoriteListCall(page: page, perPage: perPage).then((value) {
      if (value != null) {
        data = value.videos;
      } else {
        throw ('Bir sorun oluştu');
      }
    });
  }

//! Anasayfa Slider metodu 

  void fetchSlider() {
    service.sliderCall().then((value) {
      if (value != null) {
        dataSlider = value.slider;
      } else {
        throw ('Bir sorun oluştu');
      }
    });
  }

  //! Drawer menü listesi fonksiyonu

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

  //! Drawer açılır menü kategori fonksiyonu.

  void categoryCall() {
    service.categoryCall(slug: slug).then((value) {
      if (value != null) {
        dataCatVideo = value.videosx;
      } else {
        throw ('Bir sorun oluştu');
      }
    });
  }

  //! Favori kontrolü fonksiyonu

  void favoriteCheck() async {
    try {
      await service.favoriCheck(videoId: id!).then((value) async {
        if (value.status == true) {
          await service.removeFavouriteCall(id: id!);
        } else {
          await service.addFavouriteCall(id: id!);
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //! Arama fonksiyonu

  fetchSearch() {
    service.searchCall(search: search.text).then((value) {
      if (value != null) {
        searchVideoData = value.products;
      } else {
        throw ('Bir sorun oluştu');
      }
    });
  }
}
