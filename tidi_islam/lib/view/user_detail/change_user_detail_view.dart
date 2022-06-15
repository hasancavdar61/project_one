library change_user_detail_view.dart;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tidi_islam/model/user_model.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';

part '../user_detail/change_user_detail.dart';

class ChangeUserView extends StatelessWidget {
  ChangeUserView({Key? key}) : super(key: key);
  Service service = Service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () {
              GetStorage().remove('id');
              Get.offAllNamed('/');
            },
            child: const Text(
              'Çıkış Yap',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: const ChangeUserDetail(),
    );
  }
}
