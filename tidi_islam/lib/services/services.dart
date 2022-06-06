import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tidi_islam/model/login_model.dart';
import 'package:tidi_islam/model/user_model.dart';

class Service {
  final String baseUrl = "https://www.api.tidislam.com/auth/";

  final dio = Dio();
  Future<Login?> loginCall(
      {required String email, required String password}) async {
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
      debugPrint("Gelen Response => ${response.data}");

      return result;
    } else {
      throw ("Bir sorun oluştu ${response.statusCode}");
    }
  }

  Future<UserModel> userCall() async {
    String userId = await GetStorage().read("id");
    var response = await dio.get(baseUrl + "my_account",
        queryParameters: {'user_id': userId},
        options: Options(
          headers: {
            "Authorization": "Bearer $userId",
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
}
