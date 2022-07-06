library change_user_detail_view.dart;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tidi_islam/model/user_model.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';

part '../user_detail/change_user_detail.dart';

class ChangeUserView extends StatefulWidget {
  const ChangeUserView({Key? key}) : super(key: key);

  @override
  State<ChangeUserView> createState() => _ChangeUserViewState();
}

class _ChangeUserViewState extends State<ChangeUserView> {
  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          height: 50,
          child: Image.asset(
            'assets/tidislam-logo-3.png',
            fit: BoxFit.cover,
          ),
        ),
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
      body: FutureBuilder(
        future: service.userCall(),
        builder: (context, AsyncSnapshot<UserModel> snapshot) {
          if (snapshot.hasData) {
            return ChangeUserDetail(userModel: snapshot.data!);
          } else {
            return const Center(
                child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
              strokeWidth: 5.0,
            ));
          }
        },
      ),
    );
  }
}
