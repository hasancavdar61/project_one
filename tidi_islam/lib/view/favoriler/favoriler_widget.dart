import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavorilerWidget extends StatelessWidget {
  const FavorilerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Favori Video Yok',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: () => Get.toNamed("/KayitSayfasi"),
              child: Text('Kayıt Formu UI Test Butonu'))
        ],
      ),
    );
  }
}
