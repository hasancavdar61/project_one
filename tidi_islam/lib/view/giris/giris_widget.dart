import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';

class GirisWidget extends StatelessWidget {
  GirisWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const FlutterLogo(
          size: 50.0,
        ),
        const Divider(
          height: 3,
          color: Colors.grey,
        ),
        Text(
          'HOŞGELDİNİZ',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: const [
                CustomForm(
                  inputType: TextInputType.emailAddress,
                  topLabel: 'E-Posta Adresiniz*',
                  formFieldLabel: 'E-posta Giriniz',
                  maxAlan: 1,
                ),
                CustomForm(
                  inputType: TextInputType.visiblePassword,
                  topLabel: 'Şifreniz*',
                  formFieldLabel: 'Şifre Giriniz',
                  maxAlan: 1,
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal)),
            onPressed: () {
              _formKey.currentState!.validate();
            },
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: const Text(
                'GİRİŞ YAPIN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 24.0),
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Şifremi Unuttum',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.teal.shade300)),
            onPressed: () => Get.toNamed("/KayitSayfasi"),
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: const Text(
                'ÜYELİK OLUŞTUR',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
