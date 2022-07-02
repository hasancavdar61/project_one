import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tidi_islam/model/category_model.dart';
import 'package:tidi_islam/model/changepass_model.dart';
import 'package:tidi_islam/model/city_model.dart';
import 'package:tidi_islam/model/favorite_model.dart';
import 'package:tidi_islam/model/forgot_model.dart';
import 'package:tidi_islam/model/home_model.dart';
import 'package:tidi_islam/model/login_model.dart';
import 'package:tidi_islam/model/menu_model.dart';
import 'package:tidi_islam/model/slider_model.dart';
import 'package:tidi_islam/model/user_model.dart';

// Top class for all services
class Service {
  final String baseUrl = "https://www.api.tidislam.com/auth/";
  final String baseUrlHome = "https://www.api.tidislam.com/home";
  final String baseUrlMain = "https://www.api.tidislam.com/";

  final dio = Dio();
  var cookieJar = CookieJar();

  /// Login işlemi [POST] metoduyla yapılır.
  /// [email] ve [password] parametreleri gönderilir.

  Future<Login?> loginCall({
    required String email,
    required String password,
  }) async {
    FormData formData = FormData.fromMap({
      'email': email,
      'password': password,
    });
    var response = await dio.post(baseUrl + 'login',
        data: formData,
        options: Options(headers: {
          "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
        }));

    if (response.statusCode == 200) {
      var result = Login.fromJson(response.data);
      GetStorage().write("cookie", response.headers["set-cookie"]?.first);
      debugPrint("Gelen Response => ${response.headers["set-cookie"]}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  /// Anasayfa veri çekme işlemi [GET] metoduyla yapılır.
  Future<HomeModel> fetchAlbum() async {
    try {
      final response = await http
          .get(Uri.parse("https://www.api.tidislam.com/home"), headers: {
        "Content-type": "application/json",
        "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
      });

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.

        return HomeModel.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } catch (e) {
      debugPrint(e.toString());
      return HomeModel();
    }
  }

  /// [GET] metoduyla kullanıcı verileri çekilir.

  Future<UserModel> userCall() async {
    String? session = GetStorage().read("cookie");
    var response = await dio.get(baseUrl + "my_account",
        options: Options(
          headers: {
            "Cookie": session,
            "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
          },
        ));
    if (response.statusCode == 200) {
      var result = UserModel.fromJson(response.data);
      debugPrint("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  /// Şifre sıfırlama işlemi [POST] metoduyla yapılır.
  /// [email] parametresi ile kullanıcının email adresi gönderilir.

  Future<ForgotModel?> forgotPassword({required String email}) async {
    FormData formData = FormData.fromMap({'email': email});
    var response = await dio.post(baseUrl + 'forgot_password',
        data: formData,
        options: Options(headers: {
          "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
        }));
    if (response.statusCode == 200) {
      var result = ForgotModel.fromJson(response.data);

      return result;
    } else {
      throw (response.statusCode.toString());
    }
  }

  /// Şifre değiştirme işlemi [POST] metoduyla yapılır.
  /// [password] ve [passwordconf] parametreleri gönderilir.

  Future<ChangePassModel> changePassword(
      {required String password, required String passwordconf}) async {
    String? session = GetStorage().read("cookie");
    FormData formData =
        FormData.fromMap({'password': password, 'passwordconf': passwordconf});
    var response = await dio.post(baseUrl + "change_password",
        data: formData,
        options: Options(
          headers: {
            "Cookie": session,
            "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
          },
        ));
    if (response.statusCode == 200) {
      var result = ChangePassModel.fromJson(response.data);
      debugPrint("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  /// Kullanıcı bilgilerini değiştirme işlemi [POST] metoduyla yapılır.
  /// [email] - [firstname] - [lastname] - [telephone] parametreleri gönderilir.

  Future<ChangePassModel> userChange(
      {required String email,
      required String firstname,
      required String lastname,
      required String telephone}) async {
    String? session = GetStorage().read("cookie");
    FormData formData = FormData.fromMap({
      'email': email,
      'firstname': firstname,
      'telephone': telephone,
      'lastname': lastname
    });
    var response = await dio.post(baseUrl + "my_account_update",
        data: formData,
        options: Options(
          headers: {
            "Cookie": session,
            "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
          },
        ));
    if (response.statusCode == 200) {
      var result = ChangePassModel.fromJson(response.data);
      debugPrint("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  /// Favori listesine ekleme işlemi [POST] metoduyla yapılır.
  /// [id] parametresi ile favori listeye eklenen ürün id'si gönderilir.

  Future<ChangePassModel> addFavouriteCall({required String id}) async {
    String? session = GetStorage().read("cookie");
    FormData formData = FormData.fromMap({'video_id': id});
    var response = await dio.post(baseUrl + "follower",
        data: formData,
        options: Options(
          headers: {
            "Cookie": session,
            "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
          },
        ));
    if (response.statusCode == 200) {
      var result = ChangePassModel.fromJson(response.data);
      debugPrint("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  /// Favori listesinden çıkarma işlemi [POST] metoduyla yapılır.
  /// [id] parametresi ile favori listesinden çıkartılacak ürün idsi gönderilir.

  Future<ChangePassModel> removeFavouriteCall({required String id}) async {
    String? session = GetStorage().read("cookie");
    FormData formData = FormData.fromMap({'video_id': id});
    var response = await dio.post(baseUrl + "unfollower",
        data: formData,
        options: Options(
          headers: {
            "Cookie": session,
            "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
          },
        ));
    if (response.statusCode == 200) {
      var result = ChangePassModel.fromJson(response.data);
      debugPrint("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  /// Favori listesini alma işlemi [GET] metoduyla yapılır.
  /// [page] parametresi ile sayfa numarası gönderilir.
  /// [perPage] parametresi ile sayfa başına gösterilecek sayı gönderilir.

  Future<FavoriteModel?> favoriteListCall(
      {required String page, required String perPage}) async {
    String? session = GetStorage().read("cookie");

    var response = await dio.get(baseUrl + "allfollower",
        queryParameters: ({'page': page, 'per_page': perPage}),
        options: Options(
          headers: {
            "Cookie": session,
            "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
          },
        ));
    if (response.statusCode == 200) {
      var result = FavoriteModel.fromJson(response.data);
      debugPrint("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  /// Slider listesini alma işlemi [GET] metoduyla yapılır.

  Future<SliderModel?> sliderCall() async {
    var response = await dio.get(baseUrlMain + "slider",
        options: Options(
          headers: {
            "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
          },
        ));
    if (response.statusCode == 200) {
      var result = SliderModel.fromJson(response.data);
      debugPrint("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  /// Menu listesini alma işlemi [GET] metoduyla yapılır.

  Future<MenuModel?> menuCall() async {
    var response = await dio.get(baseUrlMain + "menu",
        options: Options(
          headers: {
            "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
          },
        ));
    if (response.statusCode == 200) {
      var result = MenuModel.fromJson(response.data);
      debugPrint("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  /// Kategorileri alma işlemi [GET] metoduyla yapılır.
  /// [slug] parametresi ile sayfa slugı gönderilir.

  Future<CategoryModel?> categoryCall({required String slug}) async {
    var response = await dio.get(baseUrlHome + '/slug',
        queryParameters: ({
          'slug': slug,
        }),
        options: Options(
          headers: {
            "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
          },
        ));
    if (response.statusCode == 200) {
      var result = CategoryModel.fromJson(response.data);
      debugPrint("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  Future<ChangePassModel> soruCevapCall(
      {required String path, required String name, required String msg}) async {
    String? session = GetStorage().read("cookie");
    FormData formData = FormData.fromMap({
      'video': MultipartFile.fromFile(path, filename: name),
    });
    var response =
        await dio.post('https://www.api.tidislam.com/soru_cevap/video_upload',
            data: formData,
            options: Options(
              headers: {
                "Cookie": session,
                "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
              },
            ));
    if (response.statusCode == 200) {
      var result = ChangePassModel.fromJson(response.data);
      debugPrint("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  Future soru(
      {required String path,
      required String name,
      required String type,
      required int size}) async {
    String? session = GetStorage().read("cookie");
    FormData formData = FormData.fromMap({
      "name": name,
      "type": type,
      "tmp_name": path,
      "error": 0,
      "size": size
    });

    var response =
        await dio.post('https://www.api.tidislam.com/soru_cevap/video_upload',
            data: formData,
            options: Options(
              headers: {
                "Cookie": session,
                "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
              },
            ));

    if (response.statusCode == 200) {
      debugPrint(response.data.toString());
    } else {}
  }

  /// Kullanıcı kayıt işlemi [POST] metoduyla yapılır.
  /// [name] parametresi ile kullanıcı adı gönderilir.
  /// [email] parametresi ile kullanıcı email gönderilir.
  /// [password] parametresi ile kullanıcı şifre gönderilir.
  /// [passwordconf] parametresi ile kullanıcı şifre tekrar gönderilir.
  /// [tel] parametresi ile kullanıcı telefon gönderilir.
  /// [city] parametresi ile kullanıcı şehri gönderilir.
  /// [district] parametresi ile kullanıcı ilçesi gönderilir.


  Future<ChangePassModel?> registerCall({
    required String name,
    required String surname,
    required String tel,
    required String city,
    required String district,
    required String email,
    required String password,
    required String passwordconf,
  }) async {
    FormData formData = FormData.fromMap({
      'name': name,
      'surname': surname,
      'tel': tel,
      'city_id': '61',
      'district_id': '668',
      'email': email,
      'password': password,
      'passwordconf': passwordconf,
    });
    var response = await dio.post(baseUrl + 'register',
        data: formData,
        options: Options(headers: {
          "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
        }));

    if (response.statusCode == 200) {
      var result = ChangePassModel.fromJson(response.data);
      debugPrint("Gelen Response => ${response.headers["set-cookie"]}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  Future<CityModel?> getCitiesCall() async {
    var response = await dio.get("https://www.api.tidislam.com/auth/citys",
        options: Options(
          headers: {
            "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
          },
        ));
    if (response.statusCode == 200) {
      debugPrint("Gelen Response => ${response.data}");

      return CityModel.fromJson(response.data);
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  /// Favori kontrolü [POST] metoduyla yapılır.
  /// [id] parametresi ile video id gönderilir.

  Future<ChangePassModel> favoriCheck({
    required String videoId,
  }) async {
    String? session = GetStorage().read("cookie");
    FormData formData = FormData.fromMap({'video_id': videoId});
    var response = await dio.post(baseUrl + 'followercheck',
        data: formData,
        options: Options(
          headers: {
            "Cookie": session,
            "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
          },
        ));
    if (response.statusCode == 200) {
      var result = ChangePassModel.fromJson(response.data);
      debugPrint("Gelen Response => ${response.data}");
      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
