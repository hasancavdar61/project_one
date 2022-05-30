import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';

class GirisWidget extends ConsumerStatefulWidget {
  const GirisWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GirisWidgetState();
}

class _GirisWidgetState extends ConsumerState<GirisWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'HOŞGELDİNİZ',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomForm(
                  controller: ref.read(loginRiverpod).email,
                  inputType: TextInputType.emailAddress,
                  topLabel: 'E-Posta Adresiniz*',
                  formFieldLabel: 'E-posta Giriniz',
                  maxAlan: 1,
                ),
                CustomForm(
                  controller: ref.read(loginRiverpod).password,
                  isObsecure: false,
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
              if (_formKey.currentState!.validate()) {
                ref.read(loginRiverpod).fetch();
                Future.delayed(const Duration(seconds: 2), () {
                  Get.offAllNamed('/Anasayfa');
                });
              } else {
                Get.snackbar(
                  'Hata Oluştu',
                  'Lütfen formu doğru şekilde doldurunuz',
                  backgroundColor: Colors.teal,
                  colorText: Colors.white,
                );
              }
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
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'ÜYELİK OLUŞTUR sistemi için çalışmalar devam ediyor.\nKayıt için web sitemizi ziyaret ediniz.\nAnlayışınız için teşekkür ederiz.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
