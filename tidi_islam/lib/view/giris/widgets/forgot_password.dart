import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          alignment: Alignment.center,
          height: 50,
          child: Image.asset(
            'assets/tidislam-logo-3.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: const [
          Text(
            'Çıkış yap',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Text(
                'ŞİFREMİ UNUTTUM',
                style: Theme.of(context).textTheme.headline4,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20, top: 40),
                child: AutoSizeText(
                  '''Şifre değiştirme işlemi emailinize gönderilen bağlantı ile yapılmaktadır.\nİşlem tamalandığında mailinizi kontrol etmeyi unutmayın!''',
                  style: TextStyle(color: Colors.white),
                  maxFontSize: 40.0,
                  minFontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomForm(
                  controller: ref.read(homeRiverpod).email,
                  isObsecure: false,
                  topLabel: '',
                  formFieldLabel: 'Email Giriniz',
                  maxAlan: 1,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ref.read(homeRiverpod).fetchForgot();
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
                      'BAĞLANTIYI GÖNDER',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
