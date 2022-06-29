import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:tidi_islam/model/city_model.dart';
import 'package:tidi_islam/riverpod/riverpod_management.dart';
import 'package:tidi_islam/services/services.dart';
import 'package:tidi_islam/view/soru_cevap/widgets/custom_form.dart';

class KayitWidget extends ConsumerStatefulWidget {
  KayitWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<KayitWidget> createState() => _KayitWidgetState();
  final _formKey = GlobalKey<FormState>();
}

List<CityModel>? cities = [];

class _KayitWidgetState extends ConsumerState<KayitWidget> {
  @override
  void initState() {
    setState(() {
      Service().fetchOnboarding().then((value) => cities = value);
    });
    debugPrint(cities.toString());

    super.initState();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("USA"), value: "USA"),
      const DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      const DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      const DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    ///Form yapısı ana widgeti [SingleChildScrollView]

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'KAYIT FORMU',
                style: Theme.of(context).textTheme.headline4,
              ),

              ///Form yapısını tutan parent widget.
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: widget._formKey,
                  child: Column(
                    children: [
                      /// Custom yapıda bulunan [SoruCevap]
                      CustomForm(
                        controller: ref.read(registerRiverpod).name,
                        inputType: TextInputType.name,
                        topLabel: 'İSİM*',
                        formFieldLabel: 'İsminizi Giriniz',
                        maxAlan: 1,
                      ),
                      CustomForm(
                        controller: ref.read(registerRiverpod).surname,
                        inputType: TextInputType.name,
                        topLabel: 'SOYİSİM*',
                        formFieldLabel: 'Soyisminizi Giriniz',
                        maxAlan: 1,
                      ),

                      CustomForm(
                        controller: ref.read(registerRiverpod).city,
                        inputType: TextInputType.name,
                        topLabel: 'İL*',
                        formFieldLabel: 'İl Giriniz',
                        maxAlan: 1,
                      ),
                      CustomForm(
                        controller: ref.read(registerRiverpod).district,
                        inputType: TextInputType.name,
                        topLabel: 'İLÇE*',
                        formFieldLabel: 'İlçe Giriniz',
                        maxAlan: 1,
                      ),
                      CustomForm(
                        controller: ref.read(registerRiverpod).tel,
                        mask: '###########',
                        filter: {"#": RegExp(r'[0-9]')},
                        inputType: TextInputType.phone,
                        topLabel: 'TELEFON*',
                        formFieldLabel: '0 (---) --- -- --',
                        maxAlan: 1,
                      ),
                      CustomForm(
                        controller: ref.read(registerRiverpod).email,
                        inputType: TextInputType.emailAddress,
                        topLabel: 'E-POSTA*',
                        formFieldLabel: 'eposta@epostagiriniz.com',
                        maxAlan: 1,
                      ),

                      CustomForm(
                        controller: ref.read(registerRiverpod).password,
                        isObsecure: true,
                        inputType: TextInputType.visiblePassword,
                        topLabel: 'ŞİFRE*',
                        formFieldLabel: 'Şifre Giriniz',
                        maxAlan: 1,
                      ),
                      CustomForm(
                        controller: ref.read(registerRiverpod).paswordconf,
                        isObsecure: true,
                        inputType: TextInputType.visiblePassword,
                        topLabel: 'ŞİFRE TEKRAR*',
                        formFieldLabel: 'Şifreyi Tekrar Giriniz',
                        maxAlan: 1,
                      ),
                    ],
                  ),
                ),
              ),

              /// Submit butonu [ElevatedButton]
              Container(
                padding: const EdgeInsets.all(20.0),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (widget._formKey.currentState!.validate()) {
                      ref.read(registerRiverpod).fetchRegister();
                    } else {
                      Get.snackbar(
                        'Hata Oluştu',
                        'Lütfen formu doğru şekilde doldurunuz',
                        backgroundColor: Colors.teal,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: const Text('ÜYELİK FORMUNU GÖNDER'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
