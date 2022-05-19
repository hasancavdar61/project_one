import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tidi_islam/model/login_model.dart';

class LoginService {
  final String baseUrl = "https://www.api.tidislam.com/auth/login";

  final dio = Dio();
  Future<Login?> loginCall(
      {required String email, required String password}) async {
    FormData formData = FormData.fromMap({
      'email': email,
      'password': password,
    });
    var response = await dio.post(baseUrl,
        data: formData,
        options: Options(headers: {
          "DX-API-KEY": "53a25de5-f2c1-4d7a-abd6-3046a880c425",
        }));
    if (response.statusCode == 200) {
      var result = Login.fromJson(response.data);
      debugPrint("Gelen Response => ${response.data}");

      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
