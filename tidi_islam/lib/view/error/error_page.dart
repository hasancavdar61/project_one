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
          Center(
            child: SizedBox(
              child: Icon(
                Icons.wifi_off_sharp,
                color: Colors.red,
                size: Get.height / 8,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'İnternet bağlantınızı kontrol ediniz.',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
              context.isTablet
                  ? 'Tabletiniz internete tekrar bağlandığında,\n sayfa güncellenecektir.'
                  : 'Telefonunuz internete tekrar bağlandığında,\n sayfa güncellenecektir.',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
