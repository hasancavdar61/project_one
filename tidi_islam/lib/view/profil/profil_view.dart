library profil_view.dart;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tidi_islam/model/user_model.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:tidi_islam/view/profil/widgets/shower_container.dart';

part '../profil/profil_widget.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
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
            fit: BoxFit.contain,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              GetStorage().remove('id');
              GetStorage().remove('cookie');
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
            return ProfilWidget(userModel: snapshot.data!);
          } else {
            return Center(
              child: SpinKitPumpingHeart(
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Image.asset('assets/tidislam-logo-splash.png'));
                },
              ),
            );
          }
        },
      ),
    );
  }
}
