import 'package:flutter/material.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';

class SifreDegistirmeWidget extends StatelessWidget {
  const SifreDegistirmeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'HOŞGELDİNİZ',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            child: Column(
              children: const [
                CustomForm(
                  inputType: TextInputType.visiblePassword,
                  topLabel: 'Şifre*',
                  formFieldLabel: 'Şifre Giriniz',
                  maxAlan: 1,
                ),
                CustomForm(
                  inputType: TextInputType.visiblePassword,
                  topLabel: 'Şifreniz*',
                  formFieldLabel: 'Şifreyi Tekrar Giriniz',
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
            onPressed: () {},
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: const Text(
                'ŞİFREYİ DEĞİŞTİR',
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
