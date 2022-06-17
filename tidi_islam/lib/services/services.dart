import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tidi_islam/model/changepass_model.dart';
import 'package:tidi_islam/model/favorite_model.dart';
import 'package:tidi_islam/model/forgot_model.dart';
import 'package:tidi_islam/model/home_model.dart';
import 'package:tidi_islam/model/login_model.dart';
import 'package:tidi_islam/model/slider_model.dart';
import 'package:tidi_islam/model/user_model.dart';

class Service {
  final String baseUrl = "https://www.api.tidislam.com/auth/";
  final String baseUrlHome = "https://www.api.tidislam.com/home";
  final String baseUrlMain = "https://www.api.tidislam.com/";

  final dio = Dio();
  var cookieJar = CookieJar();

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
}
