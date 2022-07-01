import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            Platform.isAndroid
                ? 'TİDİSLAM ANDROID UYGULAMASI'
                : 'TİDİSLAM iOS UYGULAMASI',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.teal),
          ),
          const SizedBox(height: 40),
          Center(
            child: SizedBox(
              width: Get.width / 2.5,
              child: Image.asset('assets/no-internet.png'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'İnternet bağlantınızı kontrol ediniz.',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
