import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';

class ChangePassword extends ConsumerStatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: CustomForm(
                    controller: ref.read(changePassRiverpod).password,
                    isObsecure: true,
                    topLabel: '',
                    formFieldLabel: 'Şifre Giriniz',
                    maxAlan: 1,
                    padding: 0.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: CustomForm(
                    controller: ref.read(changePassRiverpod).passwordconf,
                    isObsecure: true,
                    topLabel: '',
                    formFieldLabel: 'Şifreyi Tekrar Giriniz',
                    maxAlan: 1,
                    padding: 24.0,
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
                        ref.read(changePassRiverpod).fetchChangePass();
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
                        'ŞİFREYİ DEĞİŞTİR',
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
      ),
    );
  }
}
